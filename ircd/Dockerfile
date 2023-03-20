FROM alpine:3.17.2 AS build
ARG PKG="wget gcc make binutils libc6-compat g++ openssl-dev openssl curl curl-dev"
ARG VER="6.0.6"

COPY ./custom/config.settings /tmp/config.settings

RUN set -x \
    && apk add --no-cache --virtual build ${PKG} && apk add --no-cache libcurl \
    && wget -O /tmp/unrealircd https://www.unrealircd.org/downloads/unrealircd-${VER}.tar.gz \
    && mkdir -p /usr/src/ircd \
    && tar xvfz /tmp/unrealircd -C /usr/src/ircd \
    && cd /usr/src/ircd/unrealircd-${VER}/ \
    && cp /tmp/config.settings /usr/src/ircd/unrealircd-${VER}/config.settings \
    && ./Config -quick \
    && make -j$(nproc) \
    && make install \
    && rm -rf /usr/src/ircd \
    && apk del build


FROM alpine:latest
ARG USER=ircd
ARG GROUP=ircd
ARG UID=1004

RUN addgroup -S ${USER} \
    && adduser -u ${UID} -S ${USER} -G ${GROUP}

COPY --from=build /srv/unrealircd/. /srv/unrealircd

RUN chown -R ${USER}:${GROUP} /srv/unrealircd

VOLUME ["/srv/unrealircd/data","/srv/unrealircd/conf/tls"]

EXPOSE 6697/tcp
WORKDIR /srv/unrealircd
USER ${USER}

ENTRYPOINT ["/srv/unrealircd/bin/unrealircd","-F"]
