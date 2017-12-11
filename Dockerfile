FROM alpine
MAINTAINER Marco Sousa <marcomsousa+docker @ gmail.com>

RUN apk add --no-cache build-base git perl zlib-dev libc6-compat && \
    git clone https://github.com/rbsec/sslscan.git && \
    cd sslscan && \
    make static && make install && \
    cd / && rm -rf sslscan && \
    apk del  build-base git perl zlib-dev libc6-compat

USER nobody
ENTRYPOINT ["/usr/bin/sslscan"]
