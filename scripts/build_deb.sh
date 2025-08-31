#!/bin/bash
set -e

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
BUILD_DIR="$ROOT_DIR/build"
VERSION_FILE="$SCRIPT_DIR/version.txt"

if [ ! -f "$VERSION_FILE" ]; then
  echo "version.txt not found!"
  exit 1
fi
VERSION=$(tr -d '[:space:]' < "$VERSION_FILE")

cd "$BUILD_DIR"

cpack -G DEB
DEB_FILE=$(ls *.deb | head -n 1)
OUTPUT="$ROOT_DIR/Tablecruncher_v${VERSION}_Linux_x86_64.deb"
mv "$DEB_FILE" "$OUTPUT"
echo "Created $OUTPUT"
