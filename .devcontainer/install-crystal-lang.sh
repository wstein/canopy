#!/usr/bin/env bash

curl -fsSL https://packagecloud.io/84codes/crystal/gpgkey | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/84codes_crystal.gpg > /dev/null
echo "deb https://packagecloud.io/84codes/crystal/any any main" | sudo tee /etc/apt/sources.list.d/84codes_crystal.list
sudo apt-get update
sudo apt-get install crystal