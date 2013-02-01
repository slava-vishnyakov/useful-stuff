What is this?
===

My 'private' stash of useful stuff for server administration.

How to install phpsh on Ubuntu (shortcut)
===

`sudo apt-get -y install curl && (curl -L https://raw.github.com/slava-vishnyakov/useful-stuff/master/ubuntu-install-phpsh.sh | bash -e)`

How to install RVM on Ubuntu (shortcut)
===

`sudo apt-get -y install curl && (curl -L https://raw.github.com/slava-vishnyakov/useful-stuff/master/ubuntu-install-ruby.sh | bash -e) && source ~/.bash_profile`

Install Google DNS servers into vagrant machine
===

`vagrant ssh -c 'echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" | sudo tee -a /etc/resolvconf/resolv.conf.d/head; sudo /etc/init.d/resolvconf restart'`
