#---------------------------CMake Project Config-------------------------------
cmake_minimum_required(VERSION 3.10)

project(ProjectName LANGUAGES CXX)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

#---------------------------Compilation database generation--------------------
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

if(CMAKE_VERSION VERSION_LESS 3.12)
    file(APPEND ${CMAKE_BINARY_DIR}/compile_commands.json "")
else()
    file(TOUCH ${CMAKE_BINARY_DIR}/compile_commands.json)
endif()

configure_file(${CMAKE_BINARY_DIR}/compile_commands.json 
    ${CMAKE_CURRENT_SOURCE_DIR}/compile_commands.json
    COPYONLY)

#---------------------------git submodule setup--------------------------------
option(UPDATE_SUBMODULES "Update git submodules before configuration" ON)

if(UPDATE_SUBMODULES)
  include(UpdateSubmodules)
endif()

#---------------------------CCache setup---------------------------------------
find_program(CCACHE_PROGRAM ccache)
if(CCACHE_PROGRAM)
    set(CMAKE_CXX_COMPILER_LAUNCHER "${CCACHE_PROGRAM}")
    set(CMAKE_CUDA_COMPILER_LAUNCHER "${CCACHE_PROGRAM}") # CMake 3.9+
endif()

