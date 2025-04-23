export EXPORT_ENV="$HOME/esp/esp-idf/export.sh"
if [ -f "$EXPORT_ENV" ]; then
    source "$EXPORT_ENV"
fi
rm -rf build
mkdir build
cd build
cmake -G Ninja ..
ninja