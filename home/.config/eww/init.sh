#/bin/bash

state_files=('brightness_state')

mkdir -p /tmp/eww/state
for file in `${state_files[@]}`; do
    touch /tmp/eww/state/$file
done

brightness-manager
volume-manager

eww daemon --restart

eww open dock
