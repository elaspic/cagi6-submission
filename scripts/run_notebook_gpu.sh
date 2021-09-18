#!/bin/bash
#SBATCH --time=3:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=3
#SBATCH --mem=18G
#SBATCH --gres=gpu:t4:1
# #SBATCH --gres=gpu:p100:1
# #SBATCH --gres=gpu:v100:1
#SBATCH --account=rrg-pmkim
#SBATCH --job-name=elaspic2-cagi6
#SBATCH --export=ALL
#SBATCH --mail-type=BEGIN
#SBATCH --mail-user=alexey.strokach@kimlab.org
#SBATCH --output=logs/elaspic2-cagi6-%N-%j.log

set -ev

unset XDG_RUNTIME_DIR

module load singularity


NOTEBOOK_STEM=$(basename ${NOTEBOOK_PATH%%.ipynb})
NOTEBOOK_DIR=$(dirname ${NOTEBOOK_PATH})
OUTPUT_TAG="${SLURM_ARRAY_JOB_ID}-${SLURM_ARRAY_TASK_ID}-${SLURM_JOB_NODELIST}-${SLURM_JOB_ID}"

echo ${NOTEBOOK_PATH} ${NOTEBOOK_STEM} ${NOTEBOOK_DIR} ${OUTPUT_TAG}


singularity exec --bind /scratch --bind /project --nv \
  --env PYTHONPATH="$(realpath ~/workspace/elaspic2/src)" \
  ~/singularity/default-v46d.sif \
  bash -c "
source /opt/conda/etc/profile.d/conda.sh;
conda activate base;
papermill --no-progress-bar --log-output --kernel python3 '${NOTEBOOK_PATH}' '${NOTEBOOK_DIR}/${NOTEBOOK_STEM}-${OUTPUT_TAG}.ipynb'"

