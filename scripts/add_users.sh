#!/bin/bash

for i in `more userlist.txt`
do
sudo useradd -m -s /bin/bash $i && sudo echo "$i:$i" | sudo chpasswd
done
