#!/bin/bash

SRC_DIR="$(pwd)/src"
CREATED_DIR="$(pwd)/created"

# # Controlla che sia stato passato un file .ly
# if [ -z "$1" ]; then
#   echo "Usage: $0 <file.ly>"
#   exit 1
# fi

# LY_FILE="$1"
# LY_PATH="$SRC_DIR/$LY_FILE"

# if [ ! -f "$LY_PATH" ]; then
#   echo "File $LY_PATH not found."
#   exit 1
# fi

# Crea la sottocartella di destinazione in created
# SUBDIR="$(dirname "$LY_FILE")"
# DEST_DIR="$CREATED_DIR/$SUBDIR"
# mkdir -p "$DEST_DIR"

# Esegue LilyPond tramite Docker
docker run -it \
  -v "$SRC_DIR":/src \
  -v "$CREATED_DIR":/created \
  lilypond-runtime
  
  # lilypond -o "/created/$SUBDIR/$(basename "$LY_FILE" .ly)" "/src/$LY_FILE"