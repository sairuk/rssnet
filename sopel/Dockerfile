FROM alpine:latest
ARG USER=sopel
ARG GROUP=sopel
ARG UID=1004
ARG VER=7.1.9
ENV PYTHONUNBUFFERED=1

COPY custom/requirements.txt /tmp/requirements.txt

RUN addgroup -S ${USER} \
    && adduser -u ${UID} -S ${USER} -G ${GROUP}

RUN apk add --update --no-cache python3 git \
    && ln -sf python3 /usr/bin/python \
    && python3 -m ensurepip \
    && pip3 install --no-cache --upgrade pip setuptools \
    && python3 -m pip install --no-cache -r /tmp/requirements.txt \
    && python3 -m pip install --no-cache sopel==${VER}

WORKDIR /home/${USER}/
USER ${USER}

RUN mkdir .sopel

ENTRYPOINT ["sopel"]