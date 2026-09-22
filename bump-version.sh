#!/bin/bash
# Stamp a new build version into version.txt and the app HTML.
# Run before committing a deploy so clients detect the new build.
set -e
cd "$(dirname "$0")"

V=$(date -u +%Y%m%d-%H%M%S)
echo "$V" > version.txt
sed -i '' "s/const BUILD_VERSION = '[^']*'/const BUILD_VERSION = '$V'/" files/price-matrix-navigator.html

echo "Build version: $V"
grep -n "const BUILD_VERSION" files/price-matrix-navigator.html
