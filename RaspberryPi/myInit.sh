#!/bin/bash

echo "do: apt-get update"
sudo apt-get update
echo -e "\n"

echo "check: unclutter.."
unclutter --help &> /dev/null
if [ "$?" -gt "1" ]; then
	echo "install unclutter"
	sudo apt-get install unclutter -y
fi
echo -e "\n"

echo "check: python.."
python -V &> /dev/null
if [ "$?" -gt "0" ]; then
	echo "install python"
	sudo apt-get install python -y
fi
echo -e "\n"

echo "check: chromium-browser.."
chromium-browser --help &> /dev/null
if [ "$?" -gt "0" ]; then
	echo "install chromium-browser"
	sudo apt-get install chromium-browser -y
fi
echo -e "\n"

echo "check: xdotool.."
xdotool --version &> /dev/null
if [ "$?" -gt "0" ]; then
	echo "install xdotool"
	sudo apt-get install xdotool -y
fi
echo -e "\n"


echo "check: LXDE-$USER.."
#https://wiki.lxde.org/en/LXSession#autostart_configuration_file
targetDir="$HOME/.config/lxsession/LXDE-$USER"
if [ ! -d "$targetDir" ]; then
	echo "do: $targetDir"
    mkdir -p $targetDir
	cp /etc/xdg/lxsession/LXDE-$USER/* $targetDir
fi

targetFile="$targetDir/autostart"
echo "do: $targetFile"
if [ -f "$targetFile" ]; then
	rm -f $targetFile
fi

cat > $targetFile << EOL
@lxpanel --profile LXDE-$USER
@pcmanfm --desktop --profile LXDE-$USER
@xscreensaver -no-splash
@point-rpi
@xset s off
@xset s noblank
@xset -dpms
@$HOME/myStart.sh
EOL
echo -e "\n"

targetFile="$HOME/myStart.sh"
echo "do: $targetFile"
if [ -f "$targetFile" ]; then
	echo "make executable"
	chmod u+x $targetFile
fi
echo -e "\n"

read -p "Done: Press [Enter] any key to exit"