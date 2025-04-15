FROM pdal/pdal:latest

# Install system deps for uv (requires Rust)
RUN apt-get update && apt-get install -y git curl build-essential ca-certificates

# Install UV
ADD https://astral.sh/uv/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh
ENV PATH="/root/.local/bin/:$PATH"

# Install deps
# RUN uv add pdal geopandas pandas xarray shapely rioxarray tqdm matplotlib python-dateutil osmnx rasterio scikit-learn pylas

# mamba install geopandas
# mamba install conda-forge::tqdm
# mamba install conda-forge::osmnx
# pip install pylas
# mamba install conda-forge::rioxarray
