#!/bin/bash
sudo chmod o+rx /home
sudo chmod o+rx /home/npvinh
sudo chmod o+rx /home/npvinh/esp
sudo chmod o+rx /home/npvinh/esp/esp-idf
IDF_PATH="/home/npvinh/esp/esp-idf"
export IDF_PATH="$IDF_PATH"
source /home/npvinh/esp/esp-idf/export.sh
rm -rf build
mkdir build
cd build
cmake -G Ninja ..
ninja