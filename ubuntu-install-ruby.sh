if [ -d ~/.rvm ]; then
   echo "RVM already installed"
   exit 1;
fi

sudo apt-get -y update
sudo apt-get -y install curl libcurl4-gnutls-dev git nodejs build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config
\curl -L https://get.rvm.io | bash -s stable --ruby=1.9.3
source ~/.rvm/scripts/rvm
# rvm install 1.9.3 --force
rvm use 1.9.3 --default
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
