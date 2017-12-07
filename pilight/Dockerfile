ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG BUILD_VERSION

LABEL maintainer "Max van den Bosch <maxdaniel98@gmail.com>"

RUN git clone --depth 5 -b master https://www.github.com/pilight/pilight.git && \
    cd pilight && \
    chmod +x setup.sh && \
    ./setup.sh install

COPY pilight-config.json /etc/pilight/config.json
COPY run.sh /run.sh

EXPOSE 5000/tcp 5001/tcp

ENTRYPOINT ["/run.sh"]
