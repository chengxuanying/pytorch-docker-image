# ==================================================================
# module list
# ------------------------------------------------------------------
# python        3.7    (conda)
# pytorch       1.7.1  (conda)
# apex          from github
# ==================================================================


FROM mmdog/pytorch:pytorch-1.7-ib2

RUN conda install pytorch==1.7.1 torchvision==0.8.2 cudatoolkit=10.1.243 numpy=1.19.2 -c pytorch -y
RUN conda install cudnn=7.6.5 -c anaconda -y
RUN git clone https://github.com/yandex-research/rtdl.git && cd rtdl && pip install -r requirements.txt
RUN conda install -c conda-forge nodejs -y 

RUN conda env config vars set PYTHONPATH=${PYTHONPATH}:${REPO_DIR}
RUN conda env config vars set PROJECT_DIR=${REPO_DIR}
RUN conda env config vars set LD_LIBRARY_PATH=${CONDA_PREFIX}/lib:${LD_LIBRARY_PATH}
RUN conda env config vars set CUDA_HOME=${CONDA_PREFIX}
RUN conda env config vars set CUDA_ROOT=${CONDA_PREFIX}
