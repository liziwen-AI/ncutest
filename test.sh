



# 验证ncu命令，B200
ncu --version
git clone https://github.com/NVIDIA/cutlass.git
cd cutlass
mkdir build && cd build
cmake .. \
  -DCUTLASS_NVCC_ARCHS=100a \
  -DCUTLASS_ENABLE_EXAMPLES=ON \
  -DCMAKE_BUILD_TYPE=Release

$(nproc)
make -j8 70_blackwell_fp16_gemm
./examples/70_blackwell_gemm/70_blackwell_fp16_gemm
ncu --target-processes all \
    ./examples/70_blackwell_gemm/70_blackwell_fp16_gemm





# # 验证ncu命令，B300
# ncu --version
# git clone https://github.com/NVIDIA/cutlass.git
# cd cutlass
# mkdir build && cd build
# cmake .. \
#   -DCUTLASS_NVCC_ARCHS=103a \
#   -DCUTLASS_ENABLE_EXAMPLES=ON \
#   -DCMAKE_BUILD_TYPE=Release
# make -j8 89_sm103_fp4_ultra_gemm
# ./examples/89_sm103_fp4_ultra_gemm/89_sm103_fp4_ultra_gemm
# ncu --target-processes all \
#     ./examples/89_sm103_fp4_ultra_gemm/89_sm103_fp4_ultra_gemm
# ncu --target-processes all  89_sm103_fp4_ultra_gemm



