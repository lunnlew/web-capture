echo "start build ffmpeg-emcc"

source /data/emsdk/emsdk_env.sh

cd /data/web-capture/lib/

rm -rf ffmpeg-emcc

mkdir ffmpeg-emcc

cd /data/ffmpeg-3.3.9

make clean

emconfigure ./configure \
    --prefix=/data/web-capture/lib/ffmpeg-emcc \
    --cc="emcc" \
    --cxx="em++" \
    --ar="emar" \
    --cpu=generic \
    --target-os=none \
    --arch=x86_32 \
    --enable-gpl \
    --enable-version3 \
    --enable-cross-compile \
    --disable-logging \
    --disable-programs \
    --disable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-ffserver \
    --disable-doc \
    --disable-swresample \
    --disable-postproc  \
    --disable-avfilter \
    --disable-pthreads \
    --disable-w32threads \
    --disable-os2threads \
    --disable-network \
    --disable-everything \
    --enable-demuxer=mov \
    --enable-decoder=h264 \
    --enable-decoder=hevc \
    --enable-decoder=mpeg4 \
    --disable-asm \
    --disable-debug \

make

make install