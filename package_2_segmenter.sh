BANDWIDTH=0.5M
PORT=9125
mkdir -p ./package/$BANDWIDTH/
rm ./package/$BANDWIDTH/[fpc]*
mediastreamsegmenter -w 1002 -t 4 224.0.0.50:$PORT -s 16 -D -T --cmaf-fragmented --video-only -f ./package/$BANDWIDTH/

