#!/bin/bash

cd ${0%/*}
ROOT_DIR=`pwd`

GENERATOR="Unix Makefiles"
SOURCE_DIR=$ROOT_DIR/../../SampleProjectCPP
BUILD_DIR_DEBUG=$SOURCE_DIR/build/Debug

mkdir -p "$BUILD_DIR_DEBUG"
cd $BUILD_DIR_DEBUG

# clear CMake cache
rm -f "CMakeCache.txt"

# generate the project
cmake \
-G "$GENERATOR" \
-DCMAKE_BUILD_TYPE="Debug" \
"$SOURCE_DIR"

cd $ROOT_DIR

BUILD_DIR_RELEASE=$SOURCE_DIR/build/Release

mkdir -p "$BUILD_DIR_RELEASE"
cd $BUILD_DIR_RELEASE

# clear CMake cache
rm -f "CMakeCache.txt"

# generate the project
cmake \
-G "$GENERATOR" \
-DCMAKE_BUILD_TYPE="Release" \
"$SOURCE_DIR"


