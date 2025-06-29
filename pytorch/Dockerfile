ARG PYTORCH_TAG
FROM pytorch/pytorch:${PYTORCH_TAG}

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

#RUN pip install --upgrade pip

# install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

RUN pip install jupyter \
                pandas \
                pyarrow \
                opencv-python-headless \
                matplotlib \
                scikit-learn \
                scikit-image \
                scipy \
                tensorboard \
                seaborn \
                gpustat \
                timm \
                einops \
                simplejpeg \
                wandb \
                fiftyone \
                gdown \
                umap-learn

# replace vanilla Pillow with faster Pillow-SIMD
RUN pip uninstall -y pillow
RUN CC="cc -mavx2" pip install -U --force-reinstall pillow-simd

RUN apt-get clean
