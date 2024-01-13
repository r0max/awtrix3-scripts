#!/bin/bash
#
# Smart Clock Common Functions
#
# For coding style, tries to follow https://google.github.io/styleguide/shellguide.html
# For License information, see included LICENSE
#
# TODO(r0max): Check return codes from CURL
# TODO(r0max): Pipe error messages to STDERR
#

# Power matrix on|off (true|false)
# Globals:
#   CLOCK_IP
# Arguments:
#   true | false
function smartclock::power() {
  local J
  J=$( jo "${1}" )
  curl --silent --output /dev/null --show-error --fail -d "$J" -H "Content-Type: application/json" -X POST http://"${CLOCK_IP}"/api/power
}

# Set settings
# Globals:
#   CLOCK_IP
# Arguments:
#   JSON settings object
function smartclock::settings() {
  curl --silent --output /dev/null --show-error --fail -d "${1}" -H "Content-Type: application/json" -X POST http://"${CLOCK_IP}"/api/settings
}

# Show notification
# Globals:
#   CLOCK_IP
# Arguments:
#   Text to show
function smartclock::notify() {
  local J
  J=$(
    jo \
      text="${1}" \
      textCase=2 \
      center=true \
      color="#FF0000" \
      background="#AAAAFF"
  )
  curl --silent --output /dev/null --show-error --fail -d "${J}" -H "Content-Type: application/json" -X POST http://"${CLOCK_IP}"/api/notify
}
