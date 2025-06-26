ARG JAX_TAG
FROM nvcr.io/nvidia/jax:${JAX_TAG}

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
                openssh-client \
                libjpeg-dev \
                zlib1g-dev

#RUN pip install --upgrade pip
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
                torchmetrics \
                einops \
                simplejpeg \
                wandb \
                fiftyone \
                gdown \
                umap-learn \
                equinox

# replace vanilla Pillow with faster Pillow-SIMD
RUN pip uninstall -y pillow
RUN CC="cc -mavx2" pip install -U --force-reinstall pillow-simd

RUN apt-get clean
