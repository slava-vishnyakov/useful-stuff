#!/bin/bash -e

if id rails > /dev/null 2>&1
then
  echo "User rails exists. OK"
else
  echo "Creating user rails..."
  sudo useradd -s /bin/bash -d /home/rails -m rails
fi

echo "rails ALL=(ALL) NOPASSWD: /usr/bin/wget, /usr/bin/curl, /usr/bin/apt-get, /bin/mkdir, /bin/chown, /bin/chmod, /usr/sbin/update-rc.d, /usr/bin/service" | sudo tee -a /etc/sudoers

echo "Installing RVM to user 'rails'"
curl -L https://raw.github.com/slava-vishnyakov/useful-stuff/master/ubuntu-install-ruby.sh | sudo -H -u rails bash -l -e

echo "Installing Passenger to /opt/nginx/"
curl -L https://raw.github.com/slava-vishnyakov/useful-stuff/master/ubuntu-install-passenger.sh | sudo -H -u rails bash -l -e
