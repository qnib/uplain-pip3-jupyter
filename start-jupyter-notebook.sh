#!/bin/bash

: ${JUPYTER_NOTEBOOK_DIR:=/notebooks}
: ${JUPYTERPORT_BASE_DIR:=/data}
: ${JUPYTERPORT_SAVE_PATH:=/data/save}
: ${JUPYTER_CONFIG_DIR:=/etc/jupyter}
: ${JUPYTER_BASE_URL:=/}
: ${JUPYTERPORT_PAUSE_CMD:=false}

if [[ ${JUPYTERPORT_PAUSE_CMD} == "true" ]];then
  echo ">> Pause container using: tail -f /dev/null"
  tail -f /dev/null
fi

OPTS=""
if [[ "X${JUPYTER_API_TOKEN}" != "X" ]];then
  OPTS="${OPTS} --NotebookApp.token=${JUPYTER_API_TOKEN}"
fi

XDG_RUNTIME_DIR=
JUPYTER_RUNTIME_DIR="${JUPYTER_NOTEBOOK_DIR}"
XDG_DATA_HOME=${JUPYTERPORT_BASE_DIR}
XDG_RUNTIME_DIR=${JUPYTER_NOTEBOOK_DIR}

echo "> cd ${JUPYTER_NOTEBOOK_DIR}"
cd ${JUPYTER_NOTEBOOK_DIR}
jupyter --paths
echo "jupyter notebook --ip=0.0.0.0 --allow-root ${OPTS} \\"
echo "                 --notebook-dir=${JUPYTER_NOTEBOOK_DIR} \\"
echo "                 --NotebookApp.base_url=${JUPYTER_BASE_URL} \\"
echo "                 --config=/etc/jupyter/jupyter_notebook_config.py"
jupyter notebook --ip=0.0.0.0 --allow-root ${OPTS} \
                 --notebook-dir=${JUPYTER_NOTEBOOK_DIR} \
                 --NotebookApp.base_url=${JUPYTER_BASE_URL} \
                 --config=/etc/jupyter/jupyter_notebook_config.py
