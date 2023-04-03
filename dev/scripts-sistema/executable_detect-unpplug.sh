#! /bin/bash

#
# considera que hay dos dispositivos interno y externo
#
# OJO: el estado es el contrario. osea connectado es desconectado
#

export DISPLAY=:0

USER="kenny"

INTERNAL="eDP-1"
EXTERNAL="HDMI-1"

if [[ $EUID -ne 0 ]] ; then
    echo "This script must be run as root" 
    exit 1
fi

if [[ ! -f /etc/udev/rules.d/99-hotplug.rules ]] ; then
    echo "No udev rule found. Put '99-hotplug.rules' in '/etc/udev/rules.d' and execute 'udevadm control --reload' as root."
    exit
fi

export XAUTHORITY="/home/$USER/.Xauthority"

sleep 1

STATUS_EXTERNAL=`xrandr --current | grep $EXTERNAL | awk '{print $2}'`

# OJO: stado es el contrario
if [[ "$STATUS_EXTERNAL" == "disconnected" ]]
then
  su $USER -c "yad --text='con'"
  # su $USER -c "xrandr --output $EXTERNAL --auto"
  # esto lanza una aplicación que permite cambiar la configuración para tener hdmi o edp o los dos
fi

# OJO: stado es el contrario
if [[ "$STATUS_EXTERNAL" == "connected" ]]
then
  # esto deberia ejecutarse solo si eDP está off
  su $USER -c "xrandr --output $INTERNAL --auto"
  su $USER -c "xrandr --output $EXTERNAL --off"
fi

