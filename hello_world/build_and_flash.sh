#!/bin/bash
export EXPORT_ENV="/home/npvinh/esp/esp-idf/export.sh"
source "$EXPORT_ENV"
if [ -f "$EXPORT_ENV" ]; then
    source "$EXPORT_ENV"
else
    echo "ESP-IDF export script not found at $EXPORT_ENV"
    exit 1
fi
rm -rf build
mkdir build
cd build
cmake -G Ninja ..
ninja