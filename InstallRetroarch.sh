#!/bin/bash
# Made by Multipixelone
echo "Retroarch Installer by Multipixelone. Also edits config appropriatly"
if [ "$EUID" -ne 0 ]
    then echo "Sorry, I need root access. Please run as root or with sudo ;)"
    exit
fi

# Install Retroarch
sudo add-apt-repository ppa:libretro/testing
sudo apt-get update
sudo apt-get install retroarch libretro-*

# Install my config
cp retroarch.cfg ~/.config/retroarch/

# All done
echo "All done, thanks~"
