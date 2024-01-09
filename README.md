# Overview
These are some Bash scripts to automate configuration and operation of the Ulanzi Smart Pixel clock with the alternative AWTRIX Light firmware.

# Requirements
- jo, a small utility to create JSON objects (https://github.com/jpmens/jo)
- Bash and Cron

# Installation
1. Clone this repository
1. Copy `config.sh.example` to `config.sh`
1. Set IP or name of the Smart Pixel clock in `config.sh`
1. Configure colors and messages in smartclock_watch (optional)
1. Copy `CRON.example` to `/etc/cron.d/smartclock` and chown to `root:root`
5. Success!

# License
See [LICENSE](LICENSE) for licensing information.

# Links
- https://www.ulanzi.com/products/ulanzi-pixel-smart-clock-2882 (Hardware)
- https://github.com/Blueforcer/awtrix-light (AWTRIX Light firmware)
- https://blueforcer.github.io/awtrix-light/#/api (API)
