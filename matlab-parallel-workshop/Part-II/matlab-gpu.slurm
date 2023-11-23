#!/bin/sh

#SBATCH -n 1                            # 1 instance of MATLAB
#SBATCH --cpus-per-task=40              # 40 cores per instance
#SBATCH --mem-per-cpu=4gb               # 4 GB RAM per core
#SBATCH --time=00:10:00                 # 10 minutes
#SBATCH --gres=gpu:1                    # Request a single GPU
#SBATCH -p gpus

# Add MATLAB to system path
module load MATLAB

# Run code 
matlab -batch mandelbrot_example
