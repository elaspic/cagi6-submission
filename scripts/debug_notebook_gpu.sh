#!/bin/bash
#SBATCH --time=3:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=3
#SBATCH --mem=18G
# #SBATCH --gres=gpu:t4:1
#SBATCH --gres=gpu:p100:1
# #SBATCH --gres=gpu:v100:1
#SBATCH --account=rrg-pmkim
#SBATCH --job-name=elaspic2-cagi6
#SBATCH --export=ALL
#SBATCH --mail-type=BEGIN
#SBATCH --mail-user=alexey.strokach@kimlab.org
#SBATCH --output=logs/elaspic2-cagi6-%N-%j.log
#SBATCH --error=logs/elaspic2-cagi6-%N-%j.err

set -ev

unset XDG_RUNTIME_DIR

module load singularity

host=$(hostname)
if [[ $host =~ "blg" ]] ; then
  SINGULARITY_BINDS="--bind /lustre01 --bind /lustre02 --bind /lustre03 --bind /lustre04"
elif [[ $host =~ "nia" ]] ; then
  SINGULARITY_BINDS="--bind /scratch --bind /project --bind /gpfs"
elif [[ $host =~ "ng" ]] ; then
  SINGULARITY_BINDS="--bind /scratch --bind /project --bind /lustre05 --bind /lustre06 --bind /lustre07 --bind /localscratch"
else
  SINGULARITY_BINDS="--bind /scratch --bind /project"
fi
echo $host $SINGULARITY_BINDS

singularity exec ${SINGULARITY_BINDS} --nv \
  --env PYTHONPATH="$(realpath ~/workspace/elaspic2/src)" \
  ~/singularity/default-v46d.sif \
  bash -c "
source /opt/conda/etc/profile.d/conda.sh;
conda activate base;
jupyter lab --ip 0.0.0.0 --port 9000 --no-browser;"

