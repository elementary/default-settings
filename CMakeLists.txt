# Specify project does not require a compiler
project (elementary-default-settings NONE)

cmake_minimum_required (VERSION 2.8)
cmake_policy (VERSION 2.8)

list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/dpms)

add_subdirectory (dpms)
