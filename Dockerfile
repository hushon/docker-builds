FROM condaforge/miniforge3:latest

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
                sudo \
                git \
                wget \
                curl \
                zip \
                unzip \
                vim \
                zsh \
                htop \
                tmux \
                build-essential \
                openssh-client

# install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

RUN pip install gpustat

RUN apt-get clean
