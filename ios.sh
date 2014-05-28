#!/bin/bash
echo "iOS Development environment setup"
echo "Version 0.1"
echo "Created by Navied Shoushtarian"
echo "   ____    ___ __  _ _ _    ___ _____  __  ___     _           _        _                    _   ";
echo "  / __ \  |_  )  \/ | | |  / __| __\ \/ / | __|_ _| |_ ___ _ _| |_ __ _(_)_ _  _ __  ___ _ _| |_ ";
echo " / / _| \  / / () | |_  _| \__ \ _| >  <  | _|| ' \  _/ -_) '_|  _/ _\` | | ' \| '  \/ -_) ' \  _|";
echo " \ \__| / /___\__/|_| |_|  |___/_| /_/\_\ |___|_||_\__\___|_|  \__\__,_|_|_||_|_|_|_\___|_||_\__|";
echo "  \____/                                                                                         ";

if hash rvm 2>/dev/null; then
        echo "rvm installation found please uninstall with rvm implode before continuing. Aborting."
        exit 1;
fi

if hash rbenv 2>/dev/null; then
        echo "rbenv installation found please uninstall before continuing. If local installation use rm -rf ~/.rbenv or brew uninstall rbenv is homebrew was used. Aborting."
        exit 1;
fi

sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone https://github.com/navied/boxen-ios /opt/boxen/repo

echo "Starting Boxen installation of ruby, follow all onscreen dialogs"
echo "Notice: This can take upwards of 30 to 60 minutes depending on computer speed. Grab a coffee!"

/opt/boxen/repo/script/boxen

echo "[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh" >> ~/.bashrc

chmod a+x ~/.bashrc
PS1='$ '
source ~/.bashrc

echo "Setting up Ruby environment"

rbenv global 2.0.0-p481
gem install cocoapods -v 0.33.1
rbenv rehash

echo "Installing pods"

pod install

echo "If no errors are seen you are all set to run the project!"