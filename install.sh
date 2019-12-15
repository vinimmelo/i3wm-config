#!/bin/bash

echo "Configuration Script Initiated"

mkdir -p ~/.config/i3/
mkdir -p ~/.config/i3blocks/scripts/

echo
echo "Folders Created"
echo

cp config ~/.config/i3/
cp i3blocks.conf ~/.config/i3blocks/

echo
echo "Copied config and i3blocks.conf"
echo

rsync -vr scripts/ ~/.config/i3blocks/scripts

echo
echo "Scripts Copied"
echo

echo "Installation of configs finished."
