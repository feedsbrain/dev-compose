#!/bin/bash
set -x

# reclone the repo if not exists
if [ ! -d "/workdir/temp" ]; then
  mkdir -p /workdir/temp
  git clone --depth 1 --branch $1 https://github.com/AUTOMATIC1111/stable-diffusion-webui /workdir/temp/stable-diffusion-webui
fi

# copy update the original workdir
cp -R -u -p /workdir/temp/stable-diffusion-webui/* /workdir

# cleanup temp directory
rm -rdf /workdir/temp

# fix the permissions
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
