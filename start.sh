#!/bin/sh
mkdir -p /var/www/localhost/htdocs/hls
cd /var/www/localhost/htdocs
ffmpeg -protocol_whitelist file,http,https,tcp,tls,crypto -re -stream_loop -1 -f concat -safe 0 -i /playlist.txt -c:v libx264 -preset veryfast -b:v 2500k -c:a aac -b:a 128k -f hls -hls_time 6 -hls_list_size 0 -hls_segment_filename 'hls/seg_%04d.ts' 'hls/index.m3u8' > log.txt 2>&1 &
python3 -m http.server 80
