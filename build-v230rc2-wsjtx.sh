#!/bin/sh
#
# To build WSJT-X you will need CMake and asciidoc installed.
# Note that the hamlib-prefix will hang off the home directory.
#

wget https://sourceforge.net/projects/wsjt/files/wsjtx-2.3.0-rc2/wsjtx-2.3.0-rc2.tgz
tar -xzvf wsjtx-2.3.0-rc2.tgz

cd ~/wsjtx-2.3.0-rc2/src
tar -xzvf wsjtx.tgz


cp -v ~/HamlibTransceiver-REVISED.hpp wsjtx/HamlibTransceiver.hpp

mkdir build
cd build
cmake -D CMAKE_PREFIX_PATH=~/hamlib-prefix ../wsjtx -D hamlib_LIBRARY_DIRS=~/hamlib-prefix -D CMAKE_INSTALL_PREFIX=~/hbin/wsjtx -D CMAKE_BUILD_TYPE=Debug
cmake --build .
cmake --build . --target install
