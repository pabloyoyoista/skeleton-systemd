#!/bin/sh
#
# Copyright (C) 2019 Pablo Correa Gomez
#

sudo apt-get install build-essential python-dev python3-dev zlib1g-dev git python-pip python3-pip python-bottle -y
ACC_DIR="/srv/accelerator"
GROUP="accelerator"
sudo groupadd "$GROUP"
sudo usermod -aG "$GROUP" "$USER"
sudo mkdir --mode 2770 "$ACC_DIR"
sudo chown "$USER":"$GROUP" "$ACC_DIR"
git clone https://github.com/pablofsf/skeleton-systemd.git "$ACC_DIR/skeleton"
cd "$ACC_DIR/skeleton"
./init.py
cd -

sudo cp "$ACC_DIR/skeleton/sudoers_accelerator" /etc/sudoers.d/accelerator
sudo ln -s "$ACC_DIR/skeleton/daemon.sh" /usr/local/bin/daemon

mkdir "$ACC_DIR/skeleton/accelerator/urd/db"
echo "$USER:1234" > "$ACC_DIR/skeleton/accelerator/urd/db/passwd"
echo "export URD_AUTH=$USER:1234" >> "$HOME/.bashrc"
sed -i "s|^User=.*|User=${USER}|" "$ACC_DIR/skeleton/urd.service"
sudo ln -s "$ACC_DIR/skeleton/urd.service" /lib/systemd/system/urd.service
sudo systemctl start urd.service
sudo systemctl enable urd.service

sed -i "s|^User=.*|User=${USER}|" "$ACC_DIR/skeleton/accelerator.service"
sudo ln -s "$ACC_DIR/skeleton/accelerator.service" /lib/systemd/system/accelerator.service
sudo systemctl start accelerator.service
sudo systemctl enable accelerator.service
