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
#SBATCH --output=/scratch/strokach/logs/elaspic2-cagi6-%N-%j.log

set -ev

unset XDG_RUNTIME_DIR

module load singularity

singularity exec --bind /scratch --bind /project --nv \
  --env PYTHONPATH="$(realpath ~/project-rrg/workspace/elaspic2/src)" \
  ~/project-rrg/singularity-images/default-v46d.sif \
  bash -c "
source /opt/conda/etc/profile.d/conda.sh;
conda activate base;
jupyter lab --ip 0.0.0.0 --port 9000 --no-browser;"

