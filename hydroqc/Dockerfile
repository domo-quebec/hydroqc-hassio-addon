# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

# Execute during the build of the image
ARG TEMPIO_VERSION BUILD_ARCH
RUN \
    curl -sSLf -o /usr/bin/tempio \
    "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}"

RUN apk add --no-cache gcc musl-dev curl python3 py3-pip python3-dev git libffi-dev

WORKDIR /usr/src/app

RUN git clone --depth 1 --branch 0.2.2 https://gitlab.com/hydroqc/hydroqc2mqtt.git

WORKDIR /usr/src/app/hydroqc2mqtt

RUN pip install -r ./requirements.txt --force-reinstall --no-cache-dir

COPY ./entrypoint.sh ./
RUN mkdir /etc/hydroqc2mqtt/ && cp /usr/src/app/hydroqc2mqtt/config.sample.yaml /etc/hydroqc2mqtt/config.yaml

COPY . .

RUN ["chmod", "+x", "./entrypoint.sh"]

RUN python setup.py install

CMD [ "./entrypoint.sh" ]
