#!/bin/bash

echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment
echo "LANG=en_US.UTF-8" | sudo tee -a /etc/environment
sudo locale-gen en_US en_US.UTF-8
sudo dpkg-reconfigure locales
