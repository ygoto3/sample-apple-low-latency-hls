ffmpeg -f flv -listen 1 \
  -i rtmp://0.0.0.0:1935/live/ll-hls \
  -c:a aac \
  -c:v h264 -force_key_frames "expr:gte(t,n_forced*4)" -profile:v baseline \
  -map v:0 -b:0 1000k -s:0 1280x720 \
  -map a:0 \
  -bsf:v h264_mp4toannexb \
  -f mpegts \
  - | tsrecompressor -L 224.0.0.50:9123 -P 224.0.0.50:9125 -O 224.0.0.50:9121 -h -x -a

