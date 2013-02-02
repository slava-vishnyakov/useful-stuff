#!/bin/bash -e

if [ -d /opt/nginx ]; then
   echo "nginx already installed"
   exit 1;
fi

echo "Installing passenger gem"
gem install passenger

echo "Installing Passenger"
sudo mkdir /opt/nginx; sudo chown `whoami` /opt/nginx

echo "Installing Passenger's nginx"
passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx

echo "Installing nginx init.d"
sudo wget https://raw.github.com/slava-vishnyakov/useful-stuff/master/init.d-nginx.conf -O /etc/init.d/nginx

echo "Changing nginx.conf permissions"
sudo chmod o+x /etc/init.d/nginx

echo "update-rc.d"
sudo update-rc.d nginx defaults

echo "Installing nginx.conf"
sudo wget https://raw.github.com/slava-vishnyakov/useful-stuff/master/nginx.conf -O /opt/nginx/conf/nginx.conf

echo "Creating /opt/nginx/conf/rails-sites"
sudo mkdir /opt/nginx/conf/rails-sites

if id rails > /dev/null 2>&1
then
  echo "User rails exists!"
else
  echo "Creating user rails..."
  sudo useradd -s /bin/bash -d /home/rails -m rails
fi

echo "Starting nginx"
sudo service nginx start

echo "DONE!"
