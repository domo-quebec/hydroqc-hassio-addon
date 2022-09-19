<!-- https://developers.home-assistant.io/docs/add-ons/presentation#keeping-a-changelog -->

## ⚠️ WARNING: 0.4.6 update requires a reinstallation of the addon

## 0.4.6
- Addon general improvements
    - The configuration is now translated (en/fr)
    - The addon is now easier to configure (breaking change)
- Addon security improvements
    - The addon is now signed, to prevent any tampering of the official image
    - An AppArmor profile has been set
- Library hydroqc2mqtt: upgraded to v0.4.6
    - Bring minor improvements

## 0.4.5
- Library hydroqc2mqtt: upgraded to v0.4.5
    - Bring minor improvements

## 0.4.4
- Pre-built add-on image for the following architectures (amd64, i386, armhf, armv7, aarch64) to allow faster installation.
- The library hydroqc2mqtt has been upgraded to v0.4.4
    - This version now includes hourly consumption compatible with HASS Energy Dashboard. See docs for configuration steps

## 0.3.1
- Add new s6 overlay v3.x compatibility: fix https://gitlab.com/hydroqc/hydroqc-hass-addons/-/issues/4

## 0.3.0
- Bump hydro2mqtt to 0.3.0, fixes the following:
    - Fix error since winter credit end (April 1st)

## 0.2.4
- Bump hydro2mqtt to 0.2.2, fixes the following:
    - Fix non wintercredit accounts
    - Improve login

## 0.2.3
- Fix issue with custom MQTT server
- The structure of the configuration have changed a bit, you may have to do a complete reinstall of the addon if you encounter any issue. Make sure to copy the "hydro_quebec:" section of your config to easily reconfigure after re-install.

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
