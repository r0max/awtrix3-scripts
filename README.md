# Overview
Simple Bash scripts to automate configuration and operation of the Ulanzi TC001 Smart Pixel clock with the alternative AWTRIX 3 firmware.

![clock](https://github.com/r0max/awl-scripts/assets/555835/e1ced61a-edfc-4774-802b-8f690bc4a65b)

## Getting Started
These instructions will show how to install, configure, test and automate the operation of your Smart Pixel clock.

### Prerequisites
- Bash
- `jo`, a small utility to create JSON objects on the command line (https://github.com/jpmens/jo)
- Cron (for automation)
- A small system which runs 24/7 (ideally), e.g. Raspberry Pi or LXC

### Installation
1. Clone the repository
1. Copy `config.sh.example` to `config.sh`
1. Set IP address or name of the Smart Pixel clock in `config.sh`
1. Configure colors and messages in `smartclock_operate`

## Running

Currently, three scripts are implemented: `smartclock_notify`, `smartclock_operate`, `smartclock_power`.

### Display a custom message
```
./smartclock_notify "message"
```
Displays a message on the Smart Pixel clock. Messages longer then the display will be scrolled. The message will disapper after a couple seconds.

### Set clock mode depending on time
```
./smartclock_operate
```
Depending on current time (hour only), the script sets a different configuration on the Smart Pixel clock. For testing, the hour can be overriden in the file itself.

### Switch LED matrix on and off
```
./smartclock_power
```
The script will toggle the LED matrix on and off. For this, it uses a toggle file, which is configured in `config.sh`. The location of the file needs to be writeable for the user running the script.

## Automation
1. Copy `CRON.example` to `/etc/cron.d/smartclock` and chown to `root:root`
1. Choose a user to run the script under
1. Set `smartclock_operate` to run every hour
1. If you want to turn the matrix display e.g. during the night, set `smartclock_power` to run when to switch off and on again

## License
See [LICENSE](LICENSE) for licensing information.

## Links
- https://www.ulanzi.com/products/ulanzi-pixel-smart-clock-2882 (Hardware)
- https://github.com/Blueforcer/awtrix3 (AWTRIX 3 firmware)
- https://blueforcer.github.io/awtrix3/#/api (API)
