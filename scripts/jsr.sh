#!/bin/sh
set -ex
export TARGET=jsr
export JSR_NAME=@sn/try
rm dist --recursive --force
./rolldown.config.js
scripts/emit-dts.sh
cp LICENSE dist
scripts/eta.js < src/readme.md | scripts/prepend-readme.js dist/default.d.ts
scripts/emit-jsr-json.js
