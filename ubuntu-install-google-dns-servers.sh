#!/bin/bash

echo "  nameserver 8.8.8.8" | sudo tee /etc/resolvconf/resolv.conf.d/tail
echo "  nameserver 8.8.4.4" | sudo tee /etc/resolvconf/resolv.conf.d/tail
sudo /etc/init.d/resolvconf restart
