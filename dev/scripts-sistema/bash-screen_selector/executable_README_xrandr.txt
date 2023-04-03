xrandr | awk '/^(HDMI|eDP|DVI|VGA)/ {print}' | grep "primary" | awk '{print $1}'
xrandr | awk '/^(HDMI|eDP)/ {print}' | wc -l

xrandr --output eDP-1 --auto --output HDMI-1 --auto
xrandr --output eDP-1 --auto --output HDMI-1 --off
xrandr --output eDP-1 --off --output HDMI-1 --auto

ojo a esto para detectar hdmi desconectado
https://bbs.archlinux.org/viewtopic.php?id=162363

echar un ojo a este método

para reiniciar udev *no ha funcionado*
``` bash
sudo udevadm control --reload-rules && sudo udevadm trigger
```

fichero de udev -> /etc/udev/rules.d/99-hotplug.rules
``` bash
SUBSYSTEM=="drm", ACTION=="change", RUN+="/bin/sh /home/kenny/detect-unpplug.sh
```
