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

echo "Starting Boxen installation of ruby"

./script/Boxen

echo "[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh" >> ~/.bashrc

source ~/.bashrc