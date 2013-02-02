#!/bin/bash -e

if [ -d /opt/nginx ]; then
   echo "nginx already installed"
   exit 1;
fi


gem install passenger

sudo mkdir /opt/nginx; sudo chown `whoami` /opt/nginx
passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx

sudo wget https://raw.github.com/slava-vishnyakov/useful-stuff/master/init.d-nginx.conf -O /etc/init.d/nginx
sudo chmod o+x /etc/init.d/nginx

sudo update-rc.d nginx defaults

sudo wget https://raw.github.com/slava-vishnyakov/useful-stuff/master/nginx.conf -O /opt/nginx/conf/nginx.conf
sudo mkdir /opt/nginx/conf/rails-sites

if id rails > /dev/null 2>&1
  echo "User rails exists!"
else
  echo "Creating user rails..."
  sudo useradd -s /bin/bash -d /home/rails -m rails
fi

sudo service nginx start
