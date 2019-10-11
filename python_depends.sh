#!/bin/bash

set -eo pipefail

echo "Installing Python dependencies"
PY2_PKGS="
virtualenv
"

pip2 install $PY2_PKGS

exit 0
