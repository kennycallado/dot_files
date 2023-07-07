#!/bin/bash
#
# note: the --edge flag doesn't work on my system
/home/kenny/.local/bin/kitty +kitten panel --edge=bottom -o font_size=20  sh -c 'echo $(tput cols) | xargs -I_ printf "%_._s" "$(date +%H:%M)"; sleep 5s ' 
