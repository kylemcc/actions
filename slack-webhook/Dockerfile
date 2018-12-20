FROM alpine:3.8
RUN apk add --no-cache curl
ADD entrypoint.sh /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
