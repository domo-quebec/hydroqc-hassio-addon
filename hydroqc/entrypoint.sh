#!/usr/bin/with-contenv bashio

export MQTT_USERNAME=$(bashio::config 'mqtt.mqtt_username')
export MQTT_PASSWORD=$(bashio::config 'mqtt.mqtt_password')
export MQTT_HOST=$(bashio::config 'mqtt.mqtt_server')
export MQTT_PORT=$(bashio::config 'mqtt.mqtt_port')
export MQTT_DISCOVERY_DATA_TOPIC=$(bashio::config 'mqtt.mqtt_discovery_data_topic')
export MQTT_DATA_ROOT_TOPIC=$(bashio::config 'mqtt.mqtt_data_root_topic')
export CONFIG_YAML=$(bashio::config 'advanced.hydroqc_config_file')
export TZ=$(bashio::config 'advanced.timezone')
export HQ2M_SYNC_FREQUENCY=$(bashio::config 'advanced.sync_frequency')
export HQ2M_CONTRACTS_0_USERNAME=$(bashio::config 'hydro_quebec.hq_username')
export HQ2M_CONTRACTS_0_PASSWORD=$(bashio::config 'hydro_quebec.hq_password')
export HQ2M_CONTRACTS_0_CUSTOMER=$(bashio::config 'hydro_quebec.hq_customer')
export HQ2M_CONTRACTS_0_ACCOUNT=$(bashio::config 'hydro_quebec.hq_account')
export HQ2M_CONTRACTS_0_CONTRACT=$(bashio::config 'hydro_quebec.hq_contract')

# Try Hassio MQTT Auto-Configuration

if ! bashio::services.available "mqtt" && ! bashio::config.exists 'mqtt.mqtt_server'; then
    bashio::exit.nok "No internal MQTT service found and no MQTT server defined. Please install Mosquitto broker or specify your own."
else
    bashio::log.info "MQTT available, fetching server detail ..."
    if ! bashio::config.exists 'mqtt.mqtt_server'; then
        bashio::log.info "MQTT server settings not configured, trying to auto-discovering ..."
        # MQTT_PREFIX="mqtt://"
        # if [ $(bashio::services mqtt "ssl") = true ]; then
        #     MQTT_PREFIX="mqtts://"
        # fi
        # MQTT_SERVER="$MQTT_PREFIX$(bashio::services mqtt "host"):$(bashio::services mqtt "port")"
        export MQTT_HOST=$(bashio::services mqtt "host")
        export MQTT_PORT=$(bashio::services mqtt "port")
        bashio::log.info "Configuring '$MQTT_HOST' mqtt server"
    fi
    if ! bashio::config.exists 'mqtt.mqtt_username'; then
        bashio::log.info "MQTT credentials not configured, trying to auto-discovering ..."
        export MQTT_USERNAME=$(bashio::services mqtt "username")
        export MQTT_PASSWORD=$(bashio::services mqtt "password")
        bashio::log.info "Configuring '$MQTT_USERNAME' mqtt user"
    fi
fi

# Config
if [ -z "$CONFIG_YAML" ]
then
    export CONFIG_YAML="/etc/hydroqc2mqtt/config.yaml"
fi

if [ -z "$MQTT_DISCOVERY_DATA_TOPIC" ]
then
    export MQTT_DISCOVERY_DATA_TOPIC="homeassistant"
fi

if [ -z "$MQTT_DATA_ROOT_TOPIC" ]
then
    export MQTT_DATA_ROOT_TOPIC="hydroqc"
fi

if [ -z "$TZ" ]
then
    export TZ="America/Toronto"
fi

. /opt/venv/bin/activate
/opt/venv/bin/hydroqc2mqtt