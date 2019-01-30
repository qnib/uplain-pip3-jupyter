ARG DOCKER_REGISTRY=docker.io
ARG FROM_IMG_REPO=qnib
ARG FROM_IMG_NAME=uplain-pip3
ARG FROM_IMG_TAG=2019-01-30.1
ARG FROM_IMG_HASH=""

FROM ${DOCKER_REGISTRY}/${FROM_IMG_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    JUPYTER_RUNTIME_DIR=/jupyter \
    JUPYTER_CONFIG_DIR=/etc/jupyter \
    JUPYTER_PATH=/data/ \
    XDG_RUNTIME_DIR=/jupyter/ \
    XDG_DATA_HOME=/data
RUN pip3 install jupyter pandas sklearn keras
COPY start-jupyter-notebook.sh /usr/local/bin/
COPY etc/jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py
RUN chmod 777 /etc/jupyter
CMD ["start-jupyter-notebook.sh"]
