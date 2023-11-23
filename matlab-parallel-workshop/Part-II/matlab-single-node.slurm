#!/bin/sh

#SBATCH --tasks-per-node=8              # 8 local workers
#SBATCH --mem-per-cpu=4gb               # 4 GB RAM per core
#SBATCH --time=00:10:00                 # 10 minutes

# Add MATLAB to system path
module load MATLAB

# Run code 
matlab -batch calc_pi_single_node
