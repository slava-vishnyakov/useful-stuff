#!/bin/bash -e

if [ -d ~/.rvm ]; then
   echo "RVM already installed"
   exit 1;
fi

sudo mkdir /opt/nginx; sudo chown `whoami` /opt/nginx
