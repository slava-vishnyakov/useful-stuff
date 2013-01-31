sudo apt-get install curl libcurl4-gnutls-dev git nodejs build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config
\curl -L https://get.rvm.io | bash -s stable --ruby
. ~/.profile
. ~/.bash_profile
rvm install 1.9.3 --force
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
