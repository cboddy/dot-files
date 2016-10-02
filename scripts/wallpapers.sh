#!/bin/bash

#
#add wallpapers to ~/wallpapers
#
#add to cron
#*/5 * * * * /bin/bash ~/wallpapers.sh
#
#add wallpapers.sh to ~/
#

export DISPLAY=:0.0
feh --bg-fill ~/wallpapers/$(ls ~/wallpapers | sort -R | tail -1)

