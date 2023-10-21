CC = gcc
SRC = src/
CFLAGS = -O3 -pg -Ofast -march=native -g -fno-omit-frame-pointer

.DEFAULT_GOAL = MD.exe

MD.exe: $(SRC)/MD.cpp
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

clean:
	rm ./MD.exe
	rm cp_*

run:
	./MD.exe < inputdata.txt
