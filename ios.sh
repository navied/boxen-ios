#!/bin/bash
#Functions:
echo "iOS Development environment setup"
echo "Version 0.1"
echo "Created by Navied Shoushtarian"
echo "© 2014 SFX Entertainment"

if hash rvm 2>/dev/null; then
        echo "rvm installation found please uninstall before continuing.  Aborting."
        exit 1;
fi

if hash rbenv 2>/dev/null; then
        echo "rbenv installation found please uninstall before continuing.  Aborting."
        exit 1;
fi

sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone https://github.com/navied/boxen-ios /opt/boxen/repo

echo "Starting Boxen installation of ruby, follow all onscreen dialogs"

./opt/boxen/repo/script/boxen

echo "[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh" >> ~/.bashrc

source ~/.bashrc

echo "Setting up Ruby environment"

rbenv global 2.0.0-p481
gem install cocoapods -v 0.33.1
rbenv rehash

echo "Installing pods"

pod install