#!/bin/bash
sudo /bin/bash /home/npvinh/esp/esp-idf/export.sh
rm -rf build
mkdir build
cd build
cmake -G Ninja ..
ninja