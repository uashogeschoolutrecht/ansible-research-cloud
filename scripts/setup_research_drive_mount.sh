#!/bin/bash

set -eu

USER="$1"
HOME="/home/$USER"

echo "Configuring Research Drive mount for user $USER"

echo "Installing filesystem"

apt-get install debconf-utils -y
echo "davfs2 davfs2/suid_file boolean true" | debconf-set-selections
apt-get install davfs2 -y

echo "Adding user to filesystem group"

usermod -aG davfs2 "$USER"

echo "Creating mount directory"

mkdir ~/research-drive
chown -R "$USER" ~/research-drive
chmod 700 ~/research-drive

echo "Adding secrets file"

mkdir ~/.davfs2
cp  /etc/davfs2/secrets ~/.davfs2/secrets
printf "#Enter your Research Drive credentials here\n#/home/$USER/research-drive <username> <password>\n" >> ~/.davfs2/secrets
chown -R "$USER" ~/.davfs2
chmod 600 ~/.davfs2/secrets

echo "Notifying system of new mount point"

printf "https://hu.data.surfsara.nl/remote.php/nonshib-webdav /home/$USER/research-drive davfs user,rw,noauto 0 0\n" >> /etc/fstab
