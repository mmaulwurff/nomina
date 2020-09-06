#!/bin/bash

# Build script for Nomina.
#
# This script adds the latest git tag to the name, and creates the mod package.
#
# Usage:
# ./scripts/build.sh

set -e

name=build/nomina-$(git describe --abbrev=0 --tags).pk3

mkdir -p build
rm -f  "$name"
zip -R "$name" "*.md" "*.txt" "*.zs"
gzdoom "$name" "$@"
