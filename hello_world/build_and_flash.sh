#!/bin/bash
sudo chmod o+rx /home
sudo chmod o+rx /home/npvinh
sudo chmod o+rx /home/npvinh/esp
sudo chmod o+rx /home/npvinh/esp/esp-idf
if [ ! -d "$HOME/.espressif/python_env" ]; then
    echo ">>> Installing ESP-IDF Python environment..."
    cd $HOME/esp/esp-idf
    ./install.sh
fi
source /home/npvinh/esp/esp-idf/export.sh
rm -rf build
mkdir build
cd build
cmake -G Ninja ..
ninja