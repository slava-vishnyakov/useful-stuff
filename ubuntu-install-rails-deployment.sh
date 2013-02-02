#!/bin/bash -e

if id rails > /dev/null 2>&1
  echo "User rails exists. OK"
else
  echo "Creating user rails..."
  sudo useradd -s /bin/bash -d /home/rails -m rails
fi

echo "Installing RVM to user 'rails'"

echo "Installing Passenger to /opt/nginx/"
