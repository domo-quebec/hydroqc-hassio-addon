ARG BUILD_FROM
FROM $BUILD_FROM AS build-image

ARG BUILD_HYDROQC2MQTT_VERSION
RUN apk add --no-cache python3 && \
apk add --no-cache --virtual .build-dependencies gcc musl-dev curl py3-pip python3-dev git libffi-dev openssl-dev rust cargo
RUN git clone --depth 1 --branch ${BUILD_HYDROQC2MQTT_VERSION} https://gitlab.com/hydroqc/hydroqc2mqtt.git /usr/src/app/hydroqc2mqtt

WORKDIR /usr/src/app/hydroqc2mqtt

ENV NAME_HYDROQC2MQTT_VERSION=${BUILD_HYDROQC2MQTT_VERSION}
ENV CARGO_NET_GIT_FETCH_WITH_CLI=true

RUN python -m venv /opt/venv && . /opt/venv/bin/activate && \
 echo "------- Building H2M ${BUILD_HYDROQC2MQTT_VERSION} ($(git rev-parse --short HEAD)) -------" && \
 pip install --upgrade pip setuptools_scm && \
 git describe --all > .describe && \
 if ! grep -q "tags/" .describe; then export NAME_HYDROQC2MQTT_VERSION=$(python3 -m setuptools_scm); fi && \
 SETUPTOOLS_SCM_PRETEND_VERSION_FOR_HYDROQC2MQTT=${NAME_HYDROQC2MQTT_VERSION} pip install .



# Start from a clean image, and import only required files
FROM $BUILD_FROM as addon-image

LABEL org.opencontainers.image.title="Home Assistant Add-on: Hydroqc Beta"
LABEL org.opencontainers.image.description="Hydroqc-hass-addon-beta"
LABEL org.opencontainers.image.source="https://gitlab.com/hydroqc/hydroqc-hass-addons"
LABEL org.opencontainers.image.authors="Julien Cassagne - julien.e.cassagne@gmail.com"
LABEL org.opencontainers.image.licenses="Apache License 2.0"

ARG TEMPIO_VERSION BUILD_ARCH
COPY --from=build-image /opt/venv /opt/venv
COPY --from=build-image /usr/src/app/hydroqc2mqtt /usr/src/app/hydroqc2mqtt
COPY --from=build-image /opt/venv/bin/hydroqc2mqtt /opt/venv/bin/hydroqc2mqtt
WORKDIR /usr/src/app/hydroqc2mqtt
COPY . .

RUN curl -sSLf -o /usr/bin/tempio "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}" && \
 mkdir /etc/hydroqc2mqtt/ && \
 cp /usr/src/app/hydroqc2mqtt/config.sample.yaml /etc/hydroqc2mqtt/config.yaml && \
 chmod +x ./entrypoint.sh

CMD [ "./entrypoint.sh" ]
