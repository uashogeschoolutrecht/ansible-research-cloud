#!/bin/bash

set -eu

PUBLIC_KEY="$1"

# Make sure .ssh/ is present in the user's home directory
mkdir -p ~/.ssh/

# Authorize the user's public key
echo "$PUBLIC_KEY" >> ~/.ssh/authorized_keys
