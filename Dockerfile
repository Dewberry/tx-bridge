FROM pdal/pdal:latest

COPY requirements.txt requirements.txt


# Initialize mamba and conda
RUN mamba init

# Make sure shell uses bash
SHELL ["/bin/bash", "-c"]

# Install packages from requirements.txt in the base environment from Conda Forge
RUN source ~/.bashrc && \
    conda config --add channels conda-forge && \
    mamba install --file requirements.txt -n pdal -y && \
    mamba run -n pdal pip install pylas netCDF4 && \
    mamba clean --all -f -y
