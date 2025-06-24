FROM ubuntu:22.04

VOLUME /workdir

ARG ROCM_VERSION=6.4.1

ENV COMMANDLINE_ARGS="--upcast-sampling --listen"

# Build the base linux system
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y ca-certificates curl libnuma-dev gnupg \
  && curl -sL https://repo.radeon.com/rocm/rocm.gpg.key | apt-key add - \
  && printf "deb [arch=amd64] https://repo.radeon.com/rocm/apt/$ROCM_VERSION/ jammy main" | tee /etc/apt/sources.list.d/rocm.list \
  && printf 'Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600\n' | tee /etc/apt/preferences.d/rocm-pin-600 \
  && apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
  sudo \
  libelf1 \
  kmod \
  file \
  python3 \
  python3-pip \
  python3-venv \
  rocm \
  git \
  build-essential \
  google-perftools \
  libglib2.0-0 \
  bc \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# Create the working directory
WORKDIR /workdir
VOLUME /workdir

# Checkout to temp directory as base
RUN mkdir -p /workdir/temp
RUN git clone --depth 1 --branch v1.10.1 https://github.com/AUTOMATIC1111/stable-diffusion-webui /workdir/temp/stable-diffusion-webui

# $1 refers to the branch name
ENTRYPOINT [ "/entrypoint.sh", "v1.10.1"]
