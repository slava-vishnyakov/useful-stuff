#!/bin/bash -e

if [ -d /opt/nginx ]; then
   echo "nginx already installed"
   exit 1;
fi

gem install passenger
sudo mkdir /opt/nginx; sudo chown `whoami` /opt/nginx
passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx
sudo wget https://raw.github.com/slava-vishnyakov/useful-stuff/master/init.d-nginx.conf -O /etc/init.d/nginx
sudo update-rc.d nginx defaults
sudo wget https://raw.github.com/slava-vishnyakov/useful-stuff/master/nginx.conf -O /opt/nginx/conf/nginx.conf
sudo mkdir /opt/nginx/conf/rails-sites;

sudo service nginx start
