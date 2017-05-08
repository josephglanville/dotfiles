#!/bin/bash

set -eo pipefail

HOSTNAME=$1

[[ $HOSTNAME == "" ]] && echo "Usage: set_mac_hostname.sh <hostname>" && exit 1

# The name recognized by the hostname command
scutil --set HostName $HOSTNAME
# Bonjour name ending in .local
scutil --set LocalHostName $HOSTNAME
# Friendly name shown in System Preferences > Sharing
scutil --set ComputerName $HOSTNAME

exit 0
