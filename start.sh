#!/bin/bash

M3U8_URL="https://dai.google.com/ssai/event/DD7fA-HgSUaLyZp9AjRYxQ/master.m3u8"
RTMP_URL="rtmp://stream.livepush.io/live/rtmp_d22aaa0a2bba4012a4f4649000aee9d9"

while true; do
  ffmpeg -re -headers "User-Agent: Mozilla/5.0" -i "$M3U8_URL" \
  -c:v libx264 -preset ultrafast -tune zerolatency -pix_fmt yuv420p -crf 28 -r 25 -maxrate 1000k -bufsize 2000k \
  -c:a aac -b:a 64k -ar 44100 -f flv "$RTMP_URL"

  echo "FFmpeg crashed or disconnected, restarting in 5s..."
  sleep 5
done
