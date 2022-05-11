PORT=9121
mkdir -p ./package/audio/
rm ./package/audio/[fpc]*
mediastreamsegmenter -w 1002 -t 4 224.0.0.50:$PORT -s 16 -D -T --cmaf-fragmented --audio-only -f ./package/audio/

