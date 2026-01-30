#!/bin/sh
set -ex
export TARGET=npm
rm -rf dist
./rolldown.config.js
scripts/emit-dts.sh
scripts/emit-package-json.js
cp LICENSE README.md dist
