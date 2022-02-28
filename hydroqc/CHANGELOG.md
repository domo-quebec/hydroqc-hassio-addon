<!-- https://developers.home-assistant.io/docs/add-ons/presentation#keeping-a-changelog -->

## 0.2.3

- Fix custom MQTT server configuration

## 0.2.2

- hydro2mqtt 0.2.1

**Breaking Change**
- You will have to reconfigure the extension with your Hydro-Quebec information in the new format.
- With hydro2mqtt 0.2.1 the way the sensors are named changed. You will have to update your automations and lovelace configs to use the new names.
- If you have old sensors still showing try deleting the discovery topics of the old sensors in your MQTT server. All Hydroqc sensors will be under homeassistant/sensor/{yourcontractnumber} and under /homeassistant/binary_sensor/{yourcontractnumber}. If you delete all the topics they will be recreated when you restart the addon.

## 0.2.1

- Revert hydro2mqtt to 0.1.6 until 0.2.1 fix is released

## 0.2.0

**Breaking Change**
You will have to reconfigure the extension with your Hydro-Quebec information in the new format.

**New feature**

Auto-configuration for HASSOS mqtt is now available. Unless you are using a custom MQTT server the addon will be able to autodiscover and configure your MQTT addon information.

**Changes**
- addon configuration structure (beaking)
- add documentation to addon
- add home-assistant mqtt auto-discovery

## 0.1

- Initial release

Refactoring using the new Hydro Quebec API Wrapper and hydroqc2mqtt
