#!/bin/bash -e

if id rails > /dev/null 2>&1
then
  echo "User rails exists. OK"
else
  echo "Creating user rails..."
  sudo useradd -s /bin/bash -d /home/rails -m rails
fi

echo "Installing RVM to user 'rails'"
curl -L https://raw.github.com/slava-vishnyakov/useful-stuff/master/ubuntu-install-ruby.sh | sudo -u rails bash -e

echo "Installing Passenger to /opt/nginx/"
curl -L https://raw.github.com/slava-vishnyakov/useful-stuff/master/ubuntu-install-passenger.sh | sudo -u rails bash -e
