#!/bin/bash

export PYTHONPATH=$(pwd)/src 

(. venv/bin/activate && python src/midiplayer.py ${1})
  