#!/bin/bash
#
# SmartClock Common Functions
#
# For API see see https://blueforcer.github.io/awtrix-light/#/api
# Needs 'jo' installed for conversion to JSON
#
# Tries to follow https://google.github.io/styleguide/shellguide.html
#
# TODO(roland): Check return codes from CURL
# TODO(roland): Pipe error messages to STDERR
#


# Power matrix on|off (true|false)
# Globals:
#   CLOCK_IP
# Arguments:
#   true | false
function smartclock::power() {
  local J
  J=$( jo ${1} )
  curl -d "$J" -H "Content-Type: application/json" -X POST http://${CLOCK_IP}/api/power
}

# Set settings
# Globals:
#   CLOCK_IP
# Arguments:
#   JSON settings object
function smartclock::settings() {
  curl -d "${1}" -H "Content-Type: application/json" -X POST http://${CLOCK_IP}/api/settings
}

# Show notification
# Globals:
#   CLOCK_IP
# Arguments:
#   Text to show
function smartclock::notify() {

# Alternative using jq:
# J=$(jq -n \
#  --arg text "$1" \
#  --arg textCase 2 \
#  --arg center true \
#  --arg color "FF00000" \
#  --arg background "#AAAAFF" \
#  '$ARGS.named')

  local J
  J=$(
    jo \
      text="${1}" \
      textCase=2 \
      center=true \
      color="#FF0000" \
      background="#AAAAFF"
  )
  curl -d "${J}" -H "Content-Type: application/json" -X POST http://${CLOCK_IP}/api/notify
}
