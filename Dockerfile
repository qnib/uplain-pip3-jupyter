ARG DOCKER_REGISTRY=docker.io
ARG FROM_IMG_REPO=qnib
ARG FROM_IMG_NAME=uplain-cudnn-dev
ARG FROM_IMG_TAG=2018-12-23.1
ARG FROM_IMG_HASH=""

FROM ${DOCKER_REGISTRY}/${FROM_IMG_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true
RUN pip3 install jupyter
COPY start-jupyter-notebook.sh /usr/local/bin/
COPY etc/jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py
CMD ["start-jupyter-notebook.sh"]
