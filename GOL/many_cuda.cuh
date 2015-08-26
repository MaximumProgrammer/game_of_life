#ifndef MANY_CUDA_H
#define MANY_CUDA_H

#include "utilities.cuh"
#include <cuda.h>
#include <cuda_runtime.h>

// Device Functions.
__global__ void manyNextGenerationKernel(bool* currentGrid, bool* nextGrid, const int N);
__global__ void multiNextGenerationKernel(bool* currentGrid, bool* nextGrid, int N);
__device__ inline int manycalcNeighborsKernel(bool* currentGrid, int x, int left,
    int right, int center, int up , int down);
__global__ void multiGhostNextGenerationKernel2(bool* currentGrid, bool* nextGrid, int N,
    size_t pitchStart, size_t pitchDest);


__global__ void multiGhostNextGenerationKernel(bool* currentGrid, bool* nextGrid, int N);

// Host Functions.
void multiCellCuda(bool* startingGrid, int N, int maxGen);
void multiCellCudaGhost(bool* startingGrid, int N, int maxGen);

#endif // MANY_CUDA_GOL_H
