#!/bin/bash

set -e

name=nomina-$(git describe --abbrev=0 --tags).pk3

rm -f  "$name"
zip -R "$name" "*.md" "*.txt" "*.zs"
gzdoom "$name" "$@"
