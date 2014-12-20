# Thinkvision LT1421 Initializer

This for is to make the LT1421 USB screen work with Lenovo T400 which has more than 1 DVI in xrandr and different modelines.

This script is used to turn on or off a ThinkVision LT1421 USB monitor.
It has been tested on Ubuntu 14.04.

References for this script:

* thecaffiend's repo [https://github.com/thecaffiend/tvlt1421_ubuntu]
* Jochen Kirstaetter's [excellent writeup](http://jochen.kirstaetter.name/blog/linux/using-aoc-usb-monitor-in-ubuntu-1304-displaylink-e1649fwu.html) got me quite a bit of the way there. I ended here with an upgraded kernel (not Ubuntu patched) and to the point of the "works, but only paints around the cursor" (you'd know it if you saw it, it's mentioned in the comments of the post)
* This post on [using a thinkvision usb monitor in arch](https://bbs.archlinux.org/viewtopic.php?pid=1321200#p1321200) which got me the right xrandr settings to fix the painting only around the cursor issue. 
* The [how to](http://ubuntuhandbook.org/index.php/2013/11/linux-kernel-3-12-released-install-ubuntu-or-linux-mint/) on upgrading to the latest (3.12.0-031200-generic as of this writing) kernel.  


# Usage

Make the *.bash scripts executable

    $ chmod +x thinkvision-left-hdmi-right.bash thinkvision-set-left.bash thinkvision-set-right.bash

This sets the thinkvision left and my HDMI1 monitor right of my main X1 carbon

    $ bash thinkvision-left-hdmi-right.bash on

This sets the thinkvision left

    $ bash thinkvision-set-left.bash on

This sets the thinkvision right

    $ bash thinkvision-set-right.bash on

Off can be used with any of the bash scripts
ex:

    $ bash thinkvision-set-left.bash off

Best to create an alias for these so you can use them quickly


# To fit your needs

Depending on setup, regex and/or modelines might have to be adjusted.
 
Run

    $ xrandr

After you do this, look for the name of your monitor, mine on the X1 is LVDS1, I also have an HDMI monitor connected which comes up as HDMI1

Once you know this, you can change the code in these files change them. Find where I have LVDS1 change that to your monitor. 


