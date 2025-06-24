#!/bin/bash
set -x

# reclone the repo
git clone --depth 1 --branch $1 https://github.com/AUTOMATIC1111/stable-diffusion-webui /workdir/temp/stable-diffusion-webui
cd /workdir/temp/stable-diffusion-webui

# copy update the original workdir
cp -R -u -p /workdir/temp/stable-diffusion-webui/* /workdir
rm -rdf /workdir/temp
chown root:root -R /workdir

# create virtual environment
cd /workdir
python3 -m venv venv

# install extra dependencies and start webui
. venv/bin/activate
python3 -m pip config set global.cache-dir $PIP_CACHE_DIR
python3 -m pip install --upgrade pip wheel
python3 -m pip install basicsr

# allow to run webui in root mode (for container)
./webui.sh -f
