#!/usr/bin/env sh
set -eu

cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release
test -x build/hello_world
ctest --test-dir build -C Release --output-on-failure
