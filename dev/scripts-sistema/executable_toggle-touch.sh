#!/bin/bash

# Determinate the divace with xinput
DEVICE=$(xinput | grep -i touchpad | grep -o 'id=[0-9]*' | grep -o '[0-9]*')

# Determinate the state of the device
STATE=$(xinput list-props $DEVICE | grep 'Device Enabled' | grep -o '[0-9]*$')

# Toggle the state
# If the state is 0 or 2, enable the device
# If the state is 1 or 3, disable the device
# If the state is unknown, do nothing
if [ $STATE -eq 0 ] || [ $STATE -eq 2 ]; then
    xinput enable $DEVICE
elif [ $STATE -eq 1 ] || [ $STATE -eq 3 ]; then
    xinput disable $DEVICE
fi

# Make the script executable
# chmod +x toggle-touch.sh
# Run the script
# ./toggle-touch.sh
