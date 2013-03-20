#!/bin/bash -e

id rails || (echo "Creating user rails..."; sudo useradd -s /bin/bash -d /home/rails -m rails)

echo "rails ALL=(ALL) NOPASSWD: /usr/bin/wget, /usr/bin/curl, /usr/bin/apt-get, /bin/mkdir, /bin/chown, /bin/chmod, /usr/sbin/update-rc.d, /usr/bin/service" | sudo tee -a /etc/sudoers

echo "Installing RVM to user 'rails'"
curl -L https://raw.github.com/slava-vishnyakov/useful-stuff/master/ubuntu-install-ruby.sh | sudo -H -u rails bash -l -e

echo "Installing Passenger to /opt/nginx/"
curl -L https://raw.github.com/slava-vishnyakov/useful-stuff/master/ubuntu-install-passenger.sh | sudo -H -u rails bash -l -e

sudo -u rails /bin/bash -lc "mkdir /home/rails/.ssh; chmod 0700 /home/rails/.ssh; touch /home/rails/.ssh/authorized_keys"

echo "Run this: "
echo ""
echo "rails$ sudo vi /home/rails/.ssh/authorized_keys"
echo ""
echo "to add the ssh key to 'rails' user. Then you can ssh as rails@"
echo ""
echo "Create a file like /opt/nginx/conf/rails-sites/test.com.conf"
echo ""
echo "server {"
echo "  listen 80;"
echo "  server_name test.com;"
echo "  passenger_enabled on;"
echo "  root /home/rails/applications/test.com/current/public;"
echo "  # passenger_user nobody;"
echo "  passenger_max_requests 500;"
echo "}"
echo ""
echo "Then run this to reload: "
echo "rails$ sudo /opt/nginx/sbin/nginx -t && sudo /opt/nginx/sbin/nginx -s reload"
