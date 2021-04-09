#!/bin/sh
rm ./compile_commands.json

cmake -DCLANG_TIDY=OFF \
      -DCMAKE_BUILD_TYPE=Release -Bbuild-release
