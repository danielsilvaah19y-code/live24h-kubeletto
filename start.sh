#!/bin/sh
mkdir -p /usr/share/nginx/html/hls
ffmpeg -re -stream_loop -1 -f concat -safe 0 -i /playlist.txt -c:v libx264 -preset veryfast -b:v 2500k -c:a aac -b:a 128k -f hls -hls_time 6 -hls_list_size 0 -hls_segment_filename '/usr/share/nginx/html/hls/seg_%04d.ts' /usr/share/nginx/html/hls/index.m3u8 &
nginx -g 'daemon off;'
