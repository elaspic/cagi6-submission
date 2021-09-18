#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
# #SBATCH --ntasks-per-node=32
# #SBATCH --ntasks-per-node=44
#SBATCH --mem=15G
# #SBATCH --mem=110G
# #SBATCH --mem=180G
#SBATCH --account=rrg-pmkim
#SBATCH --job-name=elaspic2-cagi6
#SBATCH --export=ALL
#SBATCH --mail-type=BEGIN
#SBATCH --mail-user=alexey.strokach@kimlab.org
#SBATCH --output=logs/elaspic2-cagi6-%N-%j.log

set -ev

unset XDG_RUNTIME_DIR

module load singularity

singularity exec --bind /scratch --bind /project --bind /gpfs \
  --env PYTHONPATH="$(realpath ~/workspace/elaspic2/src)" \
  ~/singularity/default-v46d.sif \
  bash -c "
source /opt/conda/etc/profile.d/conda.sh;
conda activate base;
jupyter lab --ip 0.0.0.0 --port 9000 --no-browser;"

