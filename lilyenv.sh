#!/bin/bash

SRC_DIR="$(pwd)/music"
CREATED_DIR="$(pwd)/created"

docker run -it \
  -v "$SRC_DIR":/music \
  -v "$CREATED_DIR":/created \
  lilypond-runtime
  