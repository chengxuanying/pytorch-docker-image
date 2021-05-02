# ==================================================================
# module list
# ------------------------------------------------------------------
# python        3.7    (conda)
# pytorch       1.7.1  (conda)
# apex          from github
# ==================================================================


FROM mmdog/pytorch:pytorch-1.7-ib2

RUN pip install torch-scatter -f https://pytorch-geometric.com/whl/torch-1.7.0+cu110.html
RUN pip install torch-sparse -f https://pytorch-geometric.com/whl/torch-1.7.0+cu110.html
RUN pip install torch-cluster -f https://pytorch-geometric.com/whl/torch-1.7.0+cu110.html
RUN pip install torch-spline-conv -f https://pytorch-geometric.com/whl/torch-1.7.0+cu110.html
RUN pip install torch-geometric ogb pytorch-lightning
RUN conda install -y -c rdkit rdkit cython
