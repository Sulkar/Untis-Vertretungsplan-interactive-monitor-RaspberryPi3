echo "start unclutter in the background to remove the mouse pointer"
unclutter &
#unclutter -idle 0 &

echo "Start python3 button script in the background"
python3 /home/pi/ButtonControl.py &

echo "Start chromium-browser in fullscreen after 3 seconds"
/bin/sleep 3
#chromium-browser --no-startup-window --kiosk --app=http://vertretungsplan.meineSchule.de
chromium-browser --no-startup-window --start-fullscreen --start-maximized --app=http://vertretungsplan.meineSchule.de