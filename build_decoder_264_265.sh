echo "Beginning Build:"
rm -r ffmpeg
mkdir -p ffmpeg
cd ../ffmpeg
make clean
emconfigure ./configure --cc="emcc" --cxx="em++" --ar="emar" --prefix=$(pwd)/../decoder_wasm/ffmpeg --enable-cross-compile --target-os=none --arch=x86_32 --cpu=generic --ranlib=emranlib \
    --enable-gpl --enable-version3 --enable-shared --enable-pic \
    --disable-avdevice --disable-avformat --disable-swresample --disable-postproc --disable-avfilter \
    --disable-programs --disable-logging --disable-everything --disable-extra-warnings \
    --disable-ffplay --disable-ffprobe --disable-asm --disable-doc --disable-devices --disable-network \
    --disable-hwaccels --disable-parsers --disable-bsfs --disable-debug --disable-protocols --disable-indevs --disable-outdevs \
    --enable-decoder=hevc --enable-parser=hevc \
    --enable-decoder=h264  --enable-parser=h264
# modify config.h
#make
#make install
#cd ../decoder_wasm
#./build_decoder_wasm.sh 264_265
