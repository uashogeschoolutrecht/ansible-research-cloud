#!/bin/bash

set -eu

ansible -i inventories/"$1.yml" -m script -a "scripts/setup_research_drive_mount.sh $3" --become $2