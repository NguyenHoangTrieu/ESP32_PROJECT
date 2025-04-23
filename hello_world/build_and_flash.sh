source ~/.profile
source "$EXPORT_ENV"
# Check if the environment variable is set
if [ -z "$EXPORT_ENV" ]; then
    echo "Error: EXPORT_ENV is not set."
    exit 1
fi
rm -rf build
mkdir build
cd build
cmake -G Ninja ..
ninja