# Docker llvm build

This set of scripts allow to build quickly and LLVM/MLIR with python bindings for
any linux image (glibc >= 2.28) for python 3.12.

Before using these script you need to get docker `llvm-ccache` image:

    docker pull ghcr.io/xtc-tools/llvm-ccache:0.2.0


In the following `~/work` is just an example dir, use any dir for install `llvm-build`.

Clone LLVM somewhere if not already done, use tag 22.1.8 or own version based on this tag:

    cd ~/work
    LLVM_REVISION=llvmorg-22.1.8
    git clone --depth 1 -b $LLVM_REVISION https://github.com/llvm/llvm-project

Clone this repository also:

    cd ~/work
    git clone https://github.com/xtc-tools/llvm-build

Then for compiling your llvm/mlir project, get to the directory above `llvm-project` (here `~/work`):

     cd ~/work # must contain your llvm-project sources
     ~/work/llvm-build/cmake.sh
     ~/work/llvm-build/ninja.sh install

It will generate and install llvm/mlir in `~/work/llvm-project/build` and `~/work/llvm-project/install`.
