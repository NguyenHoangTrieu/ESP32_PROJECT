if [ -f "$EXPORT_ENV" ]; then
    source "$EXPORT_ENV"
else
    echo "Error: $EXPORT_ENV not found."
    exit 1
fi
rm -rf build
mkdir build
cd build
cmake -G Ninja ..
ninja