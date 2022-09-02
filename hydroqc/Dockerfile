ARG BUILD_FROM
FROM $BUILD_FROM AS build-image

ARG BUILD_HYDROQC2MQTT_VERSION
RUN apk add --no-cache python3 && \
apk add --no-cache --virtual .build-dependencies gcc musl-dev curl py3-pip python3-dev git libffi-dev openssl-dev rust cargo
RUN git clone --depth 1 --branch ${BUILD_HYDROQC2MQTT_VERSION} https://gitlab.com/hydroqc/hydroqc2mqtt.git /usr/src/app/hydroqc2mqtt

WORKDIR /usr/src/app/hydroqc2mqtt

RUN python -m venv /opt/venv && . /opt/venv/bin/activate && \
 pip install --upgrade pip && pip install yarl==1.7.2 setuptools-rust wheel && python setup.py install


# Start from a clean image, and import only required files
FROM $BUILD_FROM as addon-image

LABEL org.opencontainers.image.title="Home Assistant Add-on: Hydroqc"
LABEL org.opencontainers.image.description="Hydroqc-hass-addon"
LABEL org.opencontainers.image.source="https://gitlab.com/hydroqc/hydroqc-hass-addons"
LABEL org.opencontainers.image.authors="Julien Cassagne - julien.e.cassagne@gmail.com"
LABEL org.opencontainers.image.licenses="Apache License 2.0"

ARG TEMPIO_VERSION BUILD_ARCH
COPY --from=build-image /opt/venv /opt/venv
COPY --from=build-image /usr/src/app/hydroqc2mqtt /usr/src/app/hydroqc2mqtt
WORKDIR /usr/src/app/hydroqc2mqtt
COPY . .

RUN curl -sSLf -o /usr/bin/tempio "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}" && \
 mkdir /etc/hydroqc2mqtt/ && \
 cp /usr/src/app/hydroqc2mqtt/config.sample.yaml /etc/hydroqc2mqtt/config.yaml && \
 chmod +x ./entrypoint.sh

CMD [ "./entrypoint.sh" ]
