FROM ubuntu:24.04

ARG USERID=1000
ARG GROUPID=1000
ARG HOMEDIR=/home/guest
ARG LLVM_REVISION=llvmorg-22.1.8

RUN mkdir $HOMEDIR && chown $USERID:$GROUPID $HOMEDIR

USER 0:0

RUN apt-get update && apt-get install -y git

WORKDIR $HOMEDIR

USER $USERID:$GROUPID

RUN git clone --depth 1 -b $LLVM_REVISION https://github.com/llvm/llvm-project

USER 0:0

RUN apt-get update && apt-get install -y ccache cmake ninja-build python3 python3-dev python3-pip

USER $USERID:$GROUPID

RUN python3 -m pip install --break-system-packages -r llvm-project/mlir/python/requirements.txt

ENV CCACHE_DIR=$HOMEDIR/llvm-project/ccache

COPY cmake.sh /dockerfiles/

RUN mkdir -p $CCACHE_DIR && \
          mkdir llvm-project/build && \
          cd llvm-project/build && \
          cp /dockerfiles/cmake.sh . && \
          ./cmake.sh -G Ninja  ../llvm && \
          ninja -v

USER 0:0

RUN apt-get update && apt-get install -y gosu

RUN cp -pr $CCACHE_DIR /ccache
ENV CCACHE_DIR=/ccache

COPY entrypoint.sh /dockerfiles/

ENTRYPOINT ["/dockerfiles/entrypoint.sh"]

