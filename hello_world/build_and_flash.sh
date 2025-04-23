#!/bin/bash
sudo chmod +x /home/npvinh/esp/esp-idf/export.sh
export EXPORT_ENV="/home/npvinh/esp/esp-idf/export.sh"
sudo /bin/bash /home/npvinh/esp/esp-idf/export.sh
rm -rf build
mkdir build
cd build
cmake -G Ninja ..
ninja