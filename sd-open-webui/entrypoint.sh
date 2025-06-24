#!/bin/bash
set -x

# clone the repo if not exists
if [ ! -f "/workdir/webui.sh" ]; then
  mkdir -p /workdir/temp
  git clone --depth 1 --branch $1 https://github.com/AUTOMATIC1111/stable-diffusion-webui /workdir/temp
  mv /workdir/temp/.git /workdir
  mv /workdir/temp/* /workdir
  rm -rf /workdir/temp
fi

# fix the permissions
chown root:root -R /workdir

# create virtual environment
cd /workdir
python3 -m venv venv

# install extra dependencies and start webui
. venv/bin/activate
python3 -m pip config set global.cache-dir $PIP_CACHE_DIR
python3 -m pip install --upgrade pip wheel basicsr

# allow to run webui in root mode (for container)
./webui.sh -f
