#!/bin/bash

echo "Let's install i3 with his dependencies"
if [ -f /etc/os-release  ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release  ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version  ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
else
# Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
fi
echo "OS: $OS"

if [ $OS = "Debian" -o $OS = "Ubuntu" ]; then
    INSTALL="apt-get install -y"
elif [ $OS = "Arch" -o $OS = "Manjaro Linux" ]; then
    INSTALL="pacman -S"
else
    INSTALL="apt-get install"
fi
echo "$OS and $VER"

COMMAND="sudo $INSTALL i3 i3-wm i3status i3blocks i3lock i3lock-fancy rofi feh conky xbacklight"
eval $COMMAND

echo "Dependencies installed..."
