ARG UBUNTU_VERSION=24.04
FROM ubuntu:${UBUNTU_VERSION}

ARG TARGETPLATFORM

ENV CONDA_DIR=/opt/conda
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH=${CONDA_DIR}/bin:${PATH}

# 1. Install just enough for conda to work
# 2. Keep $HOME clean (no .wget-hsts file), since HSTS isn't useful in this context
# 3. Install miniforge from GitHub releases
# 4. Apply some cleanup tips from https://jcrist.github.io/conda-docker-tips.html
#    Particularly, we remove pyc and a files. The default install has no js, we can skip that
# 5. Activate base by default when running as any *non-root* user as well
#    Good security practice requires running most workloads as non-root
#    This makes sure any non-root users created also have base activated
#    for their interactive shells.
# 6. Activate base by default when running as root as well
#    The root user is already created, so won't pick up changes to /etc/skel
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
        wget bzip2 ca-certificates git tini \
                sudo \
                curl \
                zip \
                unzip \
                vim \
                zsh \
                htop \
                tmux \
                build-essential \
                openssh-client
RUN wget --no-hsts https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
RUN /bin/bash /tmp/miniconda.sh -b -p ${CONDA_DIR}
RUN rm /tmp/miniconda.sh && \
    conda clean --tarballs --index-cache --packages --yes && \
    find ${CONDA_DIR} -follow -type f -name '*.a' -delete && \
    find ${CONDA_DIR} -follow -type f -name '*.pyc' -delete && \
    conda clean --force-pkgs-dirs --all --yes  && \
    echo ". ${CONDA_DIR}/etc/profile.d/conda.sh && conda activate base" >> /etc/skel/.bashrc && \
    echo ". ${CONDA_DIR}/etc/profile.d/conda.sh && conda activate base" >> ~/.bashrc

ENTRYPOINT ["tini", "--"]
CMD [ "/bin/bash" ]

# install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin/:$PATH"

# install gdu (disk usage analyzer)
RUN apt-get install -y ncdu

RUN apt-get clean
