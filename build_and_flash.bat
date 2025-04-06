cd hello_world
rmdir /s /q build
mkdir build
cd build
cmake -G Ninja ..
ninja
ninja flash
set ESPPORT=COM9
set ESPBAUD=460800
ninja flash
set ESPBAUD=115200
ninja monitor
