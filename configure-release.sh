#!/bin/sh
rm ./compile_commands.json

cmake -G Ninja \
      -DCLANG_TIDY=OFF \
      -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang \
      -DCMAKE_BUILD_TYPE=Release -Bbuild-release
