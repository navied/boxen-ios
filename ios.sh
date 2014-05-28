#!/bin/bash
#functions
echo_c()
{
  w=$(stty size | cut -d" " -f2)       # width of the terminal
  l=${#1}                              # length of the string
  printf "%"$((l+(w-l)/2))"s\n" "$1"   # print string padded to proper width (%Ws)
}

echo_c "iOS Development Environment Setup"
echo_c "Version 0.1"
echo_c "Created by Navied Shoushtarian"
echo_c "   ____    ___ __  _ _ _    ___ _____  __  ___     _           _        _                    _   ";
echo_c "  / __ \  |_  )  \/ | | |  / __| __\ \/ / | __|_ _| |_ ___ _ _| |_ __ _(_)_ _  _ __  ___ _ _| |_ ";
echo_c " / / _| \  / / () | |_  _| \__ \ _| >  <  | _|| ' \  _/ -_) '_|  _/ _\` | | ' \| '  \/ -_) ' \  _|";
echo_c " \ \__| / /___\__/|_| |_|  |___/_| /_/\_\ |___|_||_\__\___|_|  \__\__,_|_|_||_|_|_|_\___|_||_\__|";
echo_c "  \____/                                                                                         ";

if hash rvm 2>/dev/null; then
        echo "rvm installation found please uninstall with rvm implode before continuing. Aborting."
        exit 1;
fi

if hash rbenv 2>/dev/null; then
        echo "rbenv installation found please uninstall before continuing. If local installation use rm -rf ~/.rbenv or brew uninstall rbenv is homebrew was used. Aborting."
        exit 1;
fi

echo_c "You might be asked to type in your sudo password during the installation process"

sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone https://github.com/navied/boxen-ios /opt/boxen/repo

echo "Starting Boxen installation of ruby, follow all onscreen dialogs"
echo "Notice: This portion of the install can take upwards of 30 to 60 minutes depending on computer speed. Grab a coffee!"

/opt/boxen/repo/script/boxen

until /opt/boxen/repo/script/boxen; do :; done

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

echo "Done!"