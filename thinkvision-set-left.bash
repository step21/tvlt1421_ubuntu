#!/bin/bash

E_NODEVICE=3

# only one parameter is expected. either "on" or "off" (no quotes on the 
# command line). "on" will attempt to turn on the displaylink device, "off" 
# will try to turn it off, anything else will print usage and quit.
if [ $# -lt 1 ]
then 
   echo "Usage: $0 [on/off]"
   exit
fi

case "$1" in 

# turn it on
on)
   echo "Attenpting to turn on the device!"
   ;;
# turn it off
off)
   echo "Attempting to turn off the device!"
   ;;
# otherwise
*)
   echo "Invalid option given. Expected only 'on' or 'off' (without quotes)"
   exit 1
   ;;
esac

# get the number associated with the usb monitor (the X in DVI-X from the 
# doesn't work with more than 1 DVI
DVIN=`xrandr | grep DVI.....connected | cut -f1 -d' '`

LVDSN=`xrandr | grep LVDS..connected | cut -f1 -d' '`

#if [ -n "$DVIN" ]
   if [ "$DVIN" ]
then
   #echo "Device found at DVI-$DVIN"
   echo "Device found at $DVIN"
else
   echo "No appropriate device found!"
   exit $E_NODEVICE
fi

if [ "$LVDSN" ]
then
	echo "Device found at $LVDSN"
else
	echo "No appropriate device found"
	exit $E_NODEVICE
fi

# now try to turn on or off
if [ "$1" == "on" ]
then
   xrandr --newmode "1368x768_59.90"  59.90  1368 1440 1584 1800  768 769 772 795  -HSync +Vsync
   xrandr --addmode $DVIN 1368x768_59.90
   xrandr --output $DVIN --off
   xrandr --output $DVIN --mode "1368x768_59.90" --left-of $LVDSN #Set left of LVDS1 for X1's default monitor, if you use another monitor, change LVDS1 to match your monitor
else
   # shouldn't be able to get here unless "$1" is "off" 
   xrandr --output $DVIN --off
fi
