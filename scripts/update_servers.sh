#!/bin/bash

set -eu

HOST_FILE="$1"

echo "Updating local server..."

sudo apt-get update
sudo apt-get upgrade -y

echo "Updating remote servers..."

ansible -i inventories/"$HOST_FILE.yml" all -m apt -a "upgrade=yes update_cache=yes" -b
