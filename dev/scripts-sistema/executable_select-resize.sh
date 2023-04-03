#! /bin/bash

# asignación de args
if [ $1 ]
then
  window_id=$1
else
  exit 1
fi

# yad options
title="Window resizing selector"
width=500
height=200
text="Texto descriptivo"
columnName="Options"

opciones="1 Sizto_98% 2 Browser_size 3 Half_width"

# wait for the user answer
ANSWER=`yad --list --skip-taskbar \
  --center --width=$width --height=$height \
  --title "$title" \
  --text="$text" --text-align="center" \
  --column=Id:hd --column "$columnName" \
  $opciones`

# Split the selection
selected=($(echo $ANSWER | tr "|" "\n"))

# Execute the selection
case $selected in
  1)
    icesh -w $window_id sizeto 98% 98%
    icesh -w $window_id center
    icesh -w $window_id top
    ;;
  2)
    # icesh -w $window_id sizeto 940 800
    icesh -w $window_id sizeto 940 700
    ;;
  3)
    # window_geomery=`icesh -w $window_id getGeometry`
    # window_rectang=($(echo $window_geomery | tr "+" "\n"))
    # window_width=($(echo $window_rectang | tr "x" "\n"))
    # ((window_width_half=$window_width/2))
    icesh -w $window_id sizeby -50% 0
    ;;
  *)
    echo "Error"
esac
