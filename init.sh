# 0. Export your Python paths
export PYTHONPATH="$(pwd)/src/python:$(pwd)/src/python/m5:$PYTHONPATH"

# 1. Move into the raw DRAMSim3 submodule directory
cd ext/dramsim3/DRAMsim3

# 2. Build the dramsim3 library using mkdir/cmake
mkdir -p build
cd build
cmake ..
make -j$(nproc)

# 3. Copy the compiled library to the folder gem5 expects it in
cp libdramsim3.so ..

# 4. Go back to gem5 root and restart your simulator build
cd ../../../..
python3 -m SCons build/X86/gem5.opt -j $(nproc)


