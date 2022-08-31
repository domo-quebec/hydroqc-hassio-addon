# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

# Execute during the build of the image
ARG TEMPIO_VERSION BUILD_ARCH
RUN \
    curl -sSLf -o /usr/bin/tempio \
    "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}"

RUN apk add --no-cache gcc musl-dev curl python3 py3-pip python3-dev git libffi-dev git && rm -rf /var/cache/apt/*

WORKDIR /usr/src/app

RUN git clone --depth 1 --branch main https://gitlab.com/weimdall/hydroqc2mqtt.git && git -C hydroqc2mqtt rev-parse --short HEAD

WORKDIR /usr/src/app/hydroqc2mqtt

COPY ./entrypoint.sh ./
RUN mkdir /etc/hydroqc2mqtt/ && cp /usr/src/app/hydroqc2mqtt/config.sample.yaml /etc/hydroqc2mqtt/config.yaml

COPY . .

RUN ["chmod", "+x", "./entrypoint.sh"]

RUN python3 setup.py install
# For an unknown reason, installation from git doesn't work well with pysetup when public pypip repo exist..
RUN pip uninstall --yes Hydro_Quebec_API_Wrapper && pip install --no-input Hydro_Quebec_API_Wrapper@git+https://gitlab.com/weimdall/hydroqc.git@main

CMD [ "./entrypoint.sh" ]
