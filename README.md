# hydroqc-hass-addons

HASS addon code for Hydro Quebec API Wrapper and hydroqc2mqtt integration

Supported Arch:
![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports i386 Architecture][i386-shield]

Work in progress, please report any issue.

For more information related to the sensors created and their meaning please refer to the hydroqc2mqtt project [readme](https://gitlab.com/hydroqc/hydroqc2mqtt/-/blob/main/README.md)

# Install

Option 1: click this button:
[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgitlab.com%2Fhydroqc%2Fhydroqc-hass-addons)

Option 2: Go in the supervisor page -> Add-on Store -> click on the vertical "..." on the top right of the page, add this repository: https://gitlab.com/hydroqc/hydroqc-hass-addons.git

Once completed, go into the hydroqc addon and click install.

# Setup/Configuration

You have to provide you Hydro-Quebec informations in the configuration tab. "mqtt" and "advanced" options are optional.

Optional:
You can specify a path for the config file if you want to enable/disable sensors Ex. winter credit. If not set default will be used. Ex. copy content of https://gitlab.com/hydroqc/hydroqc/-/blob/main/config.default.yaml into /config/hydroqc-config.yaml and put this path into hydroqc_config_file configuration parameter.

# TODO

- Improve entrypoint.sh and add a switch to disable winter credit.
- Create and publish and images on new releases using gitlab-ci

Let us know if you like the project or if you have bugs, suggestions, ideas.

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
