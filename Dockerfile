# Base image
FROM pdal/pdal:latest

# allow for dev only file mounting
ARG DEV="false"
ENV DEV=${DEV}

# Set the working directory in the container
WORKDIR /TX-BRIDGE

# Clone the Git repository into the /tx-bridge directory (use hpc_run branch)
RUN if [ "$DEV" = "false" ]; then git clone -b hpc_run https://github.com/andycarter-pe/tx-bridge.git /TX-BRIDGE; fi
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



