# Docker llvm build

In the following `~/work` is just an example dir, use any dir, but both `llvm-project` and `llvm-build`
must be slibing dirs.

Clone LLVM somewhere if not already done, use tag 22.1.8 or own version based on this tag:

    cd ~/work
    LLVM_REVISION=llvmorg-22.1.8
    git clone --depth 1 -b $LLVM_REVISION https://github.com/llvm/llvm-project

Clone this repository also:

    cd ~/work
    git clone https://github.com/xtc-tools/llvm-build

Then for compiling your llvm/mlir project:

     cd ~/work
     llvm-build/cmake.sh
     llvm-build/ninja.sh install

It will generate and install llvm/mlir in `~/work/llvm-project/build` and `~/work/llvm-project/build`.
