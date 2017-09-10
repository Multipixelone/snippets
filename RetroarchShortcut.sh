#!/bin/bash
# Made by Multipixelone
echo "Retroarch shortcut script made by Multipixelone"
if [ "$EUID" -ne 0 ]
  then echo "Sorry, I need root access . Please run as root or with sudo ;)"
  exit
fi

# Ask some questions
echo "Type the ROM name with no spaces. Please include filetype. E.g. legendofzelda.nes followed by [ENTER]:"
read SIMPLE
echo "Type a human readable version of the game name, E.g. Legend of Zelda followed by [ENTER]:"
read FULLNAME
echo "Please type what Libretro Core you would like to use. Note this may be ANY core, not just the listed ones"
echo
echo "Some common choices for different systems"
echo "NES - fceumm"
echo "SNES - bsnes_mercury_balanced"
echo "Gameboy - gambatte"
echo "GBA - vba_next"
echo "N64 - mupen64plus"
echo "PSX - mednafen_psx"
echo "Type your selection, the press [ENTER]:"
read CORE
echo "Please enter the path to your ROM, followed by [ENTER]:"
read -e ROMPATH

# Set filename for /usr/share/applications, as well as the comment
FILENAME=${SIMPLE%.*}.desktop
LIBRETRO=/usr/lib/libretro/${CORE,,}_libretro.so
COMMENT="Launch ${FULLNAME}"
ICON="retroarch"


# Echo variables back to user, for checking purposes
echo
#echo "Name of file: ${FILENAME}"
echo "Name in app list: ${FULLNAME}"
echo "Libretro Core: ${LIBRETRO}"
echo "Path to ROM: ${ROMPATH}"
read -p "Please check that everything is correct, then press [ENTER]"

# Icon Movement
#mkdir /opt/RetroArchPixel
#mv ${ICON} /opt/RetroArchPixel

# Copy ROMS to a central location
mkdir -r /usr/local/games/ROMs
cp ${ROMPATH} /usr/local/games/ROMs/${SIMPLE}
ROMPATH="/opt/RetroArchROMS/${SIMPLE}"

# Now to put this into a .desktop file!
echo "[Desktop Entry]" >> /usr/share/applications/${FILENAME}
echo "Name=${FULLNAME}" >> /usr/share/applications/${FILENAME}
echo "Comment=${COMMENT}"  >> /usr/share/applications/${FILENAME}
echo "Exec=retroarch -L ${LIBRETRO} ${ROMPATH}" >> /usr/share/applications/${FILENAME}
echo "Icon=${ICON}" >> /usr/share/applications/${FILENAME}
echo "Terminal=false" >> /usr/share/applications/${FILENAME}
echo "Type=Application" >> /usr/share/applications/${FILENAME}
echo "Categories=Game;" >> /usr/share/applications/${FILENAME}

# Thanks~
echo "Thanks for using Multipixelone's Shortcut Script!"
echo "I love you~"
exit 0
