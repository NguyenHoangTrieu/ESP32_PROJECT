source "$EXPORT_ENV"
rm -rf build
mkdir build
cd build
cmake -G Ninja ..
ninja