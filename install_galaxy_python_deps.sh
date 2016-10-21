#!/bin/bash
export GALAXY_VIRTUAL_ENV=/galaxy_venv
source $GALAXY_VIRTUAL_ENV/bin/activate && \
pip install setuptools pip --upgrade && \
pip install -v psutil scipy numpy rpy2 matplotlib biopython blist h5py cogent mlpy mpi4py sqlalchemy
pip install -v biom-format==1.3.0
