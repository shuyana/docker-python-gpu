FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04

SHELL ["/bin/bash", "-c"]

ENV CUDA_HOME"/usr/local/cuda" \
    DEBIAN_FRONTEND="noninteractive" \
    LC_ALL="C.UTF-8" \
    LANG="C.UTF-8" \
    TZ="Asia/Tokyo"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update \
    && apt install --no-install-recommends -y software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa

RUN apt update \
    && apt install --no-install-recommends -y \
        build-essential \
        git \
        git-lfs \
        gosu \
        htop \
        less \
        libxext6 \
        libxrender1 \
        ninja-build \
        python3.9 \
        python3.9-dev \
        python3.9-distutils \
        python3.9-venv \
        python3-pip \
        python-is-python3 \
        tmux \
        wget \
    && rm -rf /var/lib/apt/lists/* \
    && apt autoremove -y \
    && apt clean

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1 \
    && update-alternatives --set python3 /usr/bin/python3.9 \
    && python3 -m pip install --no-cache-dir --upgrade pip setuptools requests \
    && python3 -m pip install --no-cache-dir poetry

RUN adduser --disabled-password --gecos '' user

COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
