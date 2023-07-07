#! /bin/bash

#
# considera que hay dos dispositivos interno y externo
#
# OJO-1: El stado es el contrario. osea connectado es desconectado
# OJO-2: No usa un path dinámico dependiendo del
#       nombre del dispositivio interno.
#       Debería leer la carpeta _/sys/class/drm/card0-{interna}_
#       en busca de concidencias... o algo así
#


# Declaración de variables
USER="kenny"
NUM_MONITORS="$(xrandr --current | grep -w connected | grep -v disconnected | awk '{print $1}') | head -1 | wc -l"
for i in $NUM_MONITORS
do
  if [[ $i == "eDP-1" || $i == "VGA-1" ]]
  then
    INTERNAL=$i
  else
    EXTERNAL=$i
  fi
done

# Condicionales previas -> root y existe rules_file
if [[ $EUID -ne 0 ]] ; then
    echo "This script must be run as root" 
    exit 1
fi

if [[ ! -f /etc/udev/rules.d/99-hotplug.rules ]] ; then
    echo "No udev rule found. Put '99-hotplug.rules' in '/etc/udev/rules.d' and execute 'udevadm control --reload' as root."
    exit
fi

# Declaración de variables globales
export DISPLAY=:0
export XAUTHORITY="/home/$USER/.Xauthority"

# Solo una puasa para que no aparezca tan rápido.
sleep 1

# Determina el estado de la pantalla externa
STATUS_EXTERNAL=`xrandr --current | grep $EXTERNAL | awk '{print $2}'`

# OJO-1: stado es el contrario
if [[ "$STATUS_EXTERNAL" == "disconnected" ]]
then
  # esto lanza una aplicación que permite cambiar la configuración para tener HDMI o HDMI y eDP
  su $USER -c "yad --text='con'"
fi

# OJO-1: stado es el contrario
if [[ "$STATUS_EXTERNAL" == "connected" ]]
then
  check_internal_resolution=`xrandr --current | grep "$INTERNAL" | awk '{print $3}' | tr "+" "\n"`
  
  if [[ "$check_internal_resolution" == "primary" || "$check_internal_resolution" == "(normal" ]]
  then
    # OJO-2: path no dinámico
    su $USER -c "xrandr --output $EXTERNAL --off"

    resolution=`cat /sys/class/drm/card0-$INTERNAL/modes | head -1`
    su $USER -c "xrandr --output $INTERNAL --mode $resolution"
    su $USER -c "xrandr --output $INTERNAL --primary"

    su $USER -c "icewm --restart"
    # su $USER -c "xrandr --output $INTERNAL --auto"
  fi
fi

