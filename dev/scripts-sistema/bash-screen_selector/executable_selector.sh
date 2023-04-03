#! /bin/bash

NUM_MONITORS="$(xrandr --current | grep -w connected | grep -v disconnected | awk '{print $1}') | head -1 | wc -l"
for i in $NUM_MONITORS
do
  if [[ $i == "eDP-1" || $i == "VGA-1" ]]
  then
    INTERNAL=$i
  elif [[ $i == "HDMI-1" || $i == "DP-1" ]]
  then
    EXTERNAL=$i
  fi
done

icons_path="/home/kenny/dev/scripts-sistema/bash-screen_selector/icons"
cp="$icons_path/settings.desktop "

if [[ $INTERNAL == "eDP-1" ]]
then
  cp+="$icons_path/edp.desktop "
else
  cp+="$icons_path/vga.desktop "
fi
# check if external monitor is connected
STATUS_EXTERNAL=`xrandr --current | grep $EXTERNAL | awk '{print $2}'`
# STATUS_INTERNAL=`xrandr --current | grep $INTERNAL | awk '{print $2}'`

if [[ "$STATUS_EXTERNAL" == "connected" ]]
then
  cp+="$icons_path/hdmi.desktop "

  if [[ "$INTERNAL" == "eDP-1" ]]
  then
    cp+="$icons_path/both-edp.desktop "
  else
    cp+="$icons_path/both-vga.desktop "
  fi
fi

temp_path=`mktemp -d`

cp "$icons_path/settings.desktop" "$temp_path"
for i in $cp
do
  echo $i
  cp $i $temp_path
done

yad --center --width=295 --height=160 \
  --text="Seleccione una acción." --text-align="center" \
  --icons --item-width=32 --single-click \
  --read-dir="$temp_path"

# Finaliza borrando el directorio temporal
rm -fr temp_path
