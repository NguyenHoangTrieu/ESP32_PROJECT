#!/bin/bash
sudo chmod +r /home/npvinh/esp/esp-idf/export.sh
source /home/npvinh/esp/esp-idf/export.sh
rm -rf build
mkdir build
cd build
cmake -G Ninja ..
ninja