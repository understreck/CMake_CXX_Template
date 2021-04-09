#!/bin/sh
rm ./compile_commands.json

cmake -DBUILD_TESTING=ON \
      -DCLANG_TIDY=ON \
      -DGCOVR_GEN_HTML=OFF \
      -DCMAKE_BUILD_TYPE=Debug -Bbuild-debug
      
