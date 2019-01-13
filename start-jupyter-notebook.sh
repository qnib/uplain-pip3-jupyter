#!/bin/bash

: ${JUPYTER_NOTEBOOK_DIR:=/notebooks}
: ${JUPYTERPORT_BASE_DIR:=/data}
: ${JUPYTERPORT_SAVE_PATH:=/data/save}
: ${JUPYTER_BASE_URL:=/}

OPTS=""
if [[ "X${JUPYTER_API_TOKEN}" != "X" ]];then
  OPTS="${OPTS} --NotebookApp.token=${JUPYTER_API_TOKEN}"
fi

cd ${JUPYTERPORT_BASE_DIR}
echo "jupyter notebook --ip=0.0.0.0 --allow-root ${OPTS} \\"
echo "                 --notebook-dir=${JUPYTER_NOTEBOOK_DIR} \\"
echo "                 --NotebookApp.base_url=${JUPYTER_BASE_URL}"
jupyter notebook --ip=0.0.0.0 --allow-root ${OPTS} \
                 --notebook-dir=${JUPYTER_NOTEBOOK_DIR} \
                 --NotebookApp.base_url=${JUPYTER_BASE_URL}
