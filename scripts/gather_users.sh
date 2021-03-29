#!/bin/bash

set -eu

HOST_FILE=$1

ansible -i inventories/"$HOST_FILE.yml" all -m shell -a "ls /home"
