#!/bin/bash

git clone git://github.com/facebook/phpsh.git
cd phpsh/
python setup.py build
sudo python setup.py install
cd ..
rm -rf phpsh
