FROM quay.io/pypa/manylinux_2_28_x86_64 AS builder

ARG USERID=1000
ARG GROUPID=1000
ARG HOMEDIR=/home/guest
ARG LLVM_REVISION=llvmorg-22.1.8

ENV PATH=/opt/python/cp312-cp312/bin:/usr/share/Modules/bin:/opt/clang/bin:/opt/rh/gcc-toolset-14/root/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN mkdir $HOMEDIR && chown $USERID:$GROUPID $HOMEDIR

WORKDIR $HOMEDIR

COPY install-build-tools.sh /dockerfiles/

RUN /dockerfiles/install-build-tools.sh

RUN ccache --version
RUN ninja --version
RUN gosu --version
RUN python --version && pip list

USER $USERID:$GROUPID

RUN git clone --depth 1 -b $LLVM_REVISION https://github.com/llvm/llvm-project

ENV HOME=/home/guest
ENV USER=guest

RUN python3 -m pip install -r llvm-project/mlir/python/requirements.txt

ENV CCACHE_DIR=$HOMEDIR/ccache

COPY cmake.sh /dockerfiles/

RUN mkdir -p $CCACHE_DIR && \
          mkdir $HOME/llvm-project/build && \
          cd $HOME/llvm-project/build && \
          cp /dockerfiles/cmake.sh . && \
          ./cmake.sh -G Ninja  ../llvm && \
          ninja -j 26 && \
          cd $HOME && \
          rm -rf llvm-project


FROM quay.io/pypa/manylinux_2_28_x86_64

ARG USERID=1000
ARG GROUPID=1000
ARG HOMEDIR=/home/guest

ENV PATH=/opt/python/cp312-cp312/bin:/usr/share/Modules/bin:/opt/clang/bin:/opt/rh/gcc-toolset-14/root/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN mkdir $HOMEDIR && chown $USERID:$GROUPID $HOMEDIR

WORKDIR $HOMEDIR

COPY install-build-tools.sh /dockerfiles/

RUN /dockerfiles/install-build-tools.sh

USER $USERID:$GROUPID

ENV HOME=/home/guest
ENV USER=guest

COPY requirements.txt /dockerfiles/
RUN python3 -m pip install -r /dockerfiles/requirements.txt

USER 0:0

ENV CCACHE_DIR=$HOMEDIR/ccache
COPY --from=builder $CCACHE_DIR/ /ccache/
ENV CCACHE_DIR=/ccache

COPY cmake.sh entrypoint.sh /dockerfiles/

ENTRYPOINT ["/dockerfiles/entrypoint.sh"]
