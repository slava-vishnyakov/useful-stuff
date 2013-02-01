#!/bin/bash

echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" | sudo tee -a /etc/resolvconf/resolv.conf.d/head;
sudo /etc/init.d/resolvconf restart
