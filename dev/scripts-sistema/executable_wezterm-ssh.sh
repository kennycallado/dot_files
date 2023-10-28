#!/bin/bash

yad --entry \
  --title="SSH" \
  --width=400 --center \
  --borders=10 --button="gtk-ok:0" --button="gtk-cancel:1" \
  --text="Enter the ssh connection" \
  --entry-text="" | xargs -I[] wezterm ssh []
