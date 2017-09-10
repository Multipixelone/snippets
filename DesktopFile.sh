#!/bin/bash
# Made by Multipixelone
echo ".Desktop file script made by Multipixelone"
if [ "$EUID" -ne 0 ]
  then echo "Sorry, I need root access to create the desktop file. Please run with sudo ;)"
  exit
fi

# Set default comment
#COMMENT="Play this game on Steam"

# Ask some questions
echo "Type a simple name of the application in lowercase, with no spaces, followed by [ENTER]:"
read SIMPLE
echo "Type the full name of the application, followed by [ENTER]:"
read FULLNAME
echo "Command to execute, followed by [ENTER]:"
read APPID
echo "Type the comment of the application, followed by [ENTER]:"

# Set filename for /usr/share/applications
FILENAME=${SIMPLE}.desktop

# Echo variables back to user, for checking purposes
echo
echo "Name of file: ${FILENAME}"
echo "Name in app list: ${FULLNAME}"
echo "Comment in app list: ${COMMENT}"
echo "Command to Execute: ${APPID}"
read -p "Please check that everything is correct, then press [ENTER]"

# Now to put this into a .desktop file!
echo "[Desktop Entry]" >> /usr/share/applications/${FILENAME}
echo "Name=${FULLNAME}" >> /usr/share/applications/${FILENAME}
echo "Comment=${COMMENT}"  >> /usr/share/applications/${FILENAME}
echo "Exec=${APPID}" >> /usr/share/applications/${FILENAME}
echo "Icon=steam_icon_${APPID}" >> /usr/share/applications/${FILENAME}
echo "Terminal=false" >> /usr/share/applications/${FILENAME}
echo "Type=Application" >> /usr/share/applications/${FILENAME}
echo "Categories=Game;" >> /usr/share/applications/${FILENAME}

# Thanks~
echo "Thanks for using Multipixelone's Shortcut Script!"
echo "I love you~"
exit 0

