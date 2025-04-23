#!/bin/bash
source /var/lib/jenkins/esp/esp-idf/export.sh
rm -rf build
mkdir build
cd build
cmake -G Ninja ..
ninja