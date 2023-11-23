#!/bin/sh

#SBATCH -n 1                            # 1 instance of MATLAB
#SBATCH --mem-per-cpu=4gb               # 4 GB RAM per core
#SBATCH --time=00:20:00                 # 20 minutes

# Add MATLAB to system path
module load MATLAB

# Run code 
matlab -batch calc_pi_multi_node
