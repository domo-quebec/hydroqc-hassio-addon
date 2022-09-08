# Home Assistant Add-on : HydroQC

This addon will fetch the data available from your Hydro-Quebec account using your portal credentials and make the resulting data available to Home-Assistant via MQTT.\
You can find the source of the addon here: [https://gitlab.com/hydroqc/hydroqc-hass-addons](https://gitlab.com/hydroqc/hydroqc-hass-addons-beta) \
More details and information on the sensors provided is available in the [hydroqc2mqtt readme](https://gitlab.com/hydroqc/hydroqc2mqtt/-/blob/main/README.md)

## Configuration values

By default you should only need to provide your Hydro-Quebec account information for the addon to work. \
More advanced configuration are available if needed.

### hydro_quebec

#### hq_username

```email@domain.tld```

#### hq_password

```YourPortalPassword```

#### hq_customer

Customer number (Numéro de facture) from your invoice.\
10 digits, you may need to add a leading 0 to the value!!!\
Ex: '987 654 321' will be '0987654321'

```'0987654321'```

#### hq_account

Account Number (Numéro de compte) from your invoice

```'654321987654'```

#### hq_contract
Contract Number (Numéro de contrat) from your invoice\
10 digits, you may need to add a leading 0 to the value!!!\
Ex: '123 456 789' will be '0123456789'

```'0123456789'```

#### sync_hourly_consumption
A boolean that enable or disable the hourly consumption feature\
that can be used in HASS Energy Dashboard.

```true```

### mqtt

The MQTT configuration will be done automatically to use your MQTT addon in Home-Assistant OS. \
You only need to change this section if you have an external MQTT server.

```
mqtt:
  mqtt_discovery_data_topic: "homeassistant"
  mqtt_data_root_topic: "hydroqc"
  mqtt_username: 'login'
  mqtt_password: 'password'
  mqtt_server: '192.168.0.23'
  mqtt_port: '1883'

```

#### mqtt_discovery_data_topic

The mqtt discovery topic for homeassistant. Change at your own risks

```"homeassistant"```

#### mqtt_data_root_topic

The root mqtt topic where the hydroqc generated values will be published

```"hydroqc"```

### advanced

Advanced settings should probably not be touched unless you know what you are doing.

#### sync_frequency

The number of seconds to wait before refreshing sensor values.

Does not force refresh values (the add-on use internal ttl cache)
Does not affect the hourly consumption feature.


#### ha_url

The websocket url to HASS Core.

#### ha_token

The supervisor token to access the HASS websocket core api.

#### timezone

Your timezone, for most of Hydro-Quebec's customer the default "America/Toronto" is fine but we have the options for our friends in Blanc Sablon.


#### hydroqc_config_file

We use a default file. If you know what you are doing and want to provide your own file this is where you should set it's path.

## Energy Dashboard Configuration

To configure the HASS Energy Dashboard with Hydro-Quebec power consumption data, follow these steps :
- Ensure `sync_hourly_consumption` is set to `true` (default value).
- Go to Settings -> Dashboard -> Energy
- Under Electricity Grid, click Add Consumption
- In the `Consumed Energy` field, select `Hourly consumption`
- Save