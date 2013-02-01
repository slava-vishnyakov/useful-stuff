#!/bin/bash -e

if [ -d /opt/nginx ]; then
   echo "nginx already installed"
   exit 1;
fi

sudo mkdir /opt/nginx; sudo chown `whoami` /opt/nginx
passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx

