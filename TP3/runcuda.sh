#!/bin/sh
#
#SBATCH --time=01:00             # allocation for 1 minute
#SBATCH --partition=cpar     # partition (queue)
#SBATCH --constraint=k20   # allocation of 40 CPUs

module load gcc/7.2.0
module load cuda/11.3.1

time nvprof ./bin/MDpar_cuda < inputdata.txt