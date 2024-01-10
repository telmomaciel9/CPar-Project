#!/bin/sh
#BATCH --time=10:00
#SBATCH --partition=cpar
#SBATCH --constraint=k20
#SBATCH --ntasks=40

# set -x

# Output directory for result files
OUTPUT_DIR="./CUDA"
mkdir -p "$OUTPUT_DIR"

# Function to run CUDA program with specified blocks and threads
run_cuda_program() {
    local num_threads=$1
    local n=$2
    local output_file="$OUTPUT_DIR/result_${num_threads}.txt"

    echo "\n Running CUDA program for N = $n with $num_threads threads (number of blocks set automatically so that nBlocks*nThreadsPerBlock >= N)"
    time ./bin/MDpar_cuda $num_threads $n < ./inputdata.txt  > "$output_file"
}


ns=(1000 2500 5000)
threads=(16 32 64 128 256 512 1024)

for n in "${ns[@]}"
do
    for nthreads in "${threads[@]}"
    do
        run_cuda_program $nthreads $n
    done
done


echo "CUDA tests completed. Results stored in $OUTPUT_DIR"
