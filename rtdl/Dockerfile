# ==================================================================
# module list
# ------------------------------------------------------------------
# python        3.7    (conda)
# pytorch       1.7.1  (conda)
# apex          from github
# ==================================================================


FROM nvidia/cuda:11.0-cudnn8-devel-ubuntu18.04

ENV LANG C.UTF-8
ENV OFED_VERSION=5.2-1.0.4.0

RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
    GIT_CLONE="git clone --depth 10" && \
    rm -rf /var/lib/apt/lists/* \
           /etc/apt/sources.list.d/cuda.list \
           /etc/apt/sources.list.d/nvidia-ml.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        software-properties-common \
        && \
    add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main" && \
    apt-get update && \

# ==================================================================
# tools
# ------------------------------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        build-essential \
        apt-utils \
        ca-certificates \
        libnccl2=2.7.8-1+cuda11.0 \
        wget \
        git \
        vim \
        libssl-dev \
        curl \
        unzip \
        unrar \
        cmake \
        net-tools \
        sudo \
        autotools-dev \
        rsync \
        jq \
        openssh-server

# ==================================================================
# python
# ------------------------------------------------------------------

ENV PATH /usr/local/nvidia/bin:/usr/local/nvidia/lib64:$PATH
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib64:/usr/local/cuda/lib64:$LD_LIBRARY_PATH
ENV PYTHON_VERSION=3.8.8
RUN wget -O ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /opt/conda && \
     rm ~/miniconda.sh
ENV PATH /opt/conda/bin:$PATH
RUN conda install -y python=3.8.8 numpy scipy h5py scikit-learn matplotlib dask pandas pyyaml mkl

RUN conda install pytorch==1.7.1 torchvision==0.8.2 cudatoolkit=10.1.243 numpy=1.19.2 -c pytorch -y
RUN conda install cudnn=7.6.5 -c anaconda -y
RUN git clone https://github.com/yandex-research/rtdl.git && cd rtdl && pip install -r requirements.txt
RUN conda install -c conda-forge nodejs -y 

RUN conda env config vars set PYTHONPATH=${PYTHONPATH}:${REPO_DIR}
RUN conda env config vars set PROJECT_DIR=${REPO_DIR}
RUN conda env config vars set LD_LIBRARY_PATH=${CONDA_PREFIX}/lib:${LD_LIBRARY_PATH}
RUN conda env config vars set CUDA_HOME=${CONDA_PREFIX}
RUN conda env config vars set CUDA_ROOT=${CONDA_PREFIX}

# force update numpy by pip due to cython error
RUN pip install numpy --upgrade
# install more
RUN pip install tensorboard tensorboardX six tqdm lmdb pyarrow py-lz4framed methodtools pathlib regex cython cffi sacrebleu editdistance
