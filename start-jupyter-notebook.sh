#!/bin/bash

: ${JUPYTER_NOTEBOOK_DIR:=/notebooks}

jupyter notebook --ip=0.0.0.0 --allow-root --notebook-dir=${JUPYTER_NOTEBOOK_DIR}
