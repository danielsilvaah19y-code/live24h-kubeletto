FROM alpine:latest
RUN apk add --no-cache ffmpeg nginx ca-certificates
COPY start.sh /start.sh
COPY playlist.txt /playlist.txt
RUN chmod +x /start.sh
EXPOSE 80
CMD ["/start.sh"]
