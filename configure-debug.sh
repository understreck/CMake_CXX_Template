#!/bin/sh
rm ./compile_commands.json

cmake -G Ninja \
      -DBUILD_TESTING=ON \
      -DGCOVR_GEN_HTML=OFF \
      -DCLANG_TIDY=ON \
      -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang \
      -DCMAKE_BUILD_TYPE=Debug -Bbuild-debug
      
