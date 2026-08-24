#!/bin/bash
set -e  # 出错立即停止



# sudo apt update && sudo apt install -y cmake make build-essential git
# git clone https://github.com/liziwen-AI/ncutest.git
# . ncutest/vast.sh


sudo apt-get install -y cuda-toolkit-13-0
sudo apt install micro -y
export PATH=/usr/local/cuda-13.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-13.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export CUDA_HOME=/usr/local/cuda-13.0

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p $HOME/miniconda3
$HOME/miniconda3/bin/conda init bash
# source ~/.bashrc

conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
conda create -n py312 python=3.12 -y
conda activate py312

pip3 install torch torchvision
pip install "nvidia-cutlass-dsl[cu13]==4.7.0"

python -c "import torch; print(torch.__version__); print(torch.cuda.is_available())"
