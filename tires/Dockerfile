FROM alpine:3.19

RUN apk add --no-cache \
    curl \
    python3 \
    py3-requests \
    py3-beautifulsoup4 \
    git \
    make \
    gcc \
    musl-dev

WORKDIR /app

RUN git clone https://github.com/trealla-prolog/trealla.git /tmp/trealla \
    && cd /tmp/trealla \
    && make \
    && make install \
    && rm -rf /tmp/trealla

COPY main.sh /app/main.sh

RUN chmod +x /app/main.sh

CMD ["./main.sh"]
