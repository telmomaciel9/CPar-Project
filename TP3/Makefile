SHELL = /bin/sh
BIN_NAME = MDpar_cuda 

CXX = nvcc
LD  = nvcc

CC = gcc
SRC = src/

CXXFLAGS   = -O2 -g -std=c++11 -arch=sm_35 -Wno-deprecated-gpu-targets 
CFLAGS = -O3 -pg -Ofast -march=native -g -fno-omit-frame-pointer -ftree-vectorize -mavx

SRC_DIR = src
BIN_DIR = bin
BUILD_DIR = build
SRC = $(wildcard $(SRC_DIR)/*.cu)
OBJ = $(patsubst src/%.cu,build/%.o,$(SRC))
BIN = $(BIN_NAME)

vpath %.cu $(SRC_DIR)


.DEFAULT_GOAL = all


$(BUILD_DIR)/%.o: %.cu
	$(CXX) -c $(CXXFLAGS) $(INCLUDES) $< -o $@ $(LIBS)

$(BIN_DIR)/$(BIN_NAME): $(OBJ)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -o $@ $(OBJ) $(LIBS)

bin/MDseq.exe: src/MDseq.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) src/MDseq.cpp -lm -o bin/MDseq.exe

bin/MDpar.exe: src/MDpar.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) src/MDpar.cpp -lm -fopenmp -o bin/MDpar.exe

checkdirs:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(BIN_DIR)

all: checkdirs $(BIN_DIR)/$(BIN_NAME) bin/MDseq.exe bin/MDpar.exe
	
clean:
	rm -f $(BUILD_DIR)/* $(BIN_DIR)/* 
	rm -f ./MD*.exe
	rm -f cp_*

runseq:
	./bin/MDseq.exe < inputdata.txt

runpar: 
	export OMP_NUM_THREADS=2;\
	sbatch test.sh

run:
	sbatch scriptcuda.sh






