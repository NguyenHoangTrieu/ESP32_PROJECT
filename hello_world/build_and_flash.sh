#!/bin/bash
sudo chmod +x /home/npvinh/esp/esp-idf/export.sh
sudo source /home/npvinh/esp/esp-idf/export.sh
rm -rf build
mkdir build
cd build
cmake -G Ninja ..
ninja