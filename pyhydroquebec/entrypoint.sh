#!/usr/bin/env bashio

export MQTT_USERNAME=$(bashio::config 'mqtt_username')
export MQTT_PASSWORD=$(bashio::config 'mqtt_password')
export MQTT_HOST=$(bashio::config 'mqtt_host')
export MQTT_PORT=$(bashio::config 'mqtt_port')
export MQTT_DISCOVERY_DATA_TOPIC=$(bashio::config 'mqtt_discovery_data_topic')
export MQTT_DATA_ROOT_TOPIC=$(bashio::config 'mqtt_data_root_topic')
export CONFIG_YAML=$(bashio::config 'hydroqc_config_file')
export HQ2M_CONTRACTS_0_USERNAME=$(bashio::config 'HQ_account_user')
export HQ2M_CONTRACTS_0_PASSWORD=$(bashio::config 'HQ_account_password')
export HQ2M_CONTRACTS_0_CUSTOMER=$(bashio::config 'HQ_customer_number')
export HQ2M_CONTRACTS_0_ACCOUNT=$(bashio::config 'HQ_account_number')
export HQ2M_CONTRACTS_0_CONTRACT=$(bashio::config 'HQ_contract_number')

# Config
if [ -z "$CONFIG_YAML" ]
then
    export CONFIG_YAML="/etc/hydroqc2mqtt/config.yaml"
fi

if [ -z "$MQTT_HOST" ]
then
    export MQTT_HOST="core-mosquitto"
fi

if [ -z "$MQTT_PORT" ]
then
    export MQTT_PORT="1883"
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

/usr/local/bin/hydroqc2mqtt
