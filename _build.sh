#!/bin/bash -ex

#export CC=/opt/fst-gcc/9.1.0/bin/gcc
#export CXX=/opt/fst-gcc/9.1.0/bin/g++

rm -rf ./CMakeFiles/

#	-DMI_DEBUG_FULL=ON \
#	-DMI_SECURE=ON \
/opt/fst-cmake/bin/cmake . \
	-DCMAKE_C_COMPILER=/opt/fst-gcc/9.1.0/bin/gcc \
	-DCMAKE_CXX_COMPILER=/opt/fst-gcc/9.1.0/bin/g++ \
	-DCMAKE_INSTALL_PREFIX=${HOME}/destdir/mimalloc \
	-DMI_SECURE=OFF \
	-DMI_DEBUG_FULL=ON \
	-DMI_OVERRIDE=ON \
	-DMI_BUILD_TESTS=ON

make -j 4 all || error "===> Failed to compile mimalloc."
make test || error "===> Mimalloc build failed stress tests."
