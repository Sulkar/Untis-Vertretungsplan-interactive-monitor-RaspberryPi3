#browser and python start
echo "start unclutter in the background to remove the mouse pointer"
unclutter &
echo "Start python3 button script in the background"
python3 /home/pi/ButtonControl.py &
echo "Start midori in fullscreen after 3 seconds"
/bin/sleep 3
midori -e Fullscreen -a http://vertretungsplan.meineSchule.de
