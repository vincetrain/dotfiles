#/bin/bash

## Get the current workspace ID. If 
workspace_curr=$(hyprctl monitors -j | jq '.[0].specialWorkspace.id')
if [[ $workspace_curr -eq 0 ]]; then
    workspace_curr=$(hyprctl activeworkspace -j | jq '.id')
fi

## Check if the active window is in the active workspace, and if it is fullscreen state 2. True fullscreenstate is 2, false if fullscreenstate not 2.
activewindow_fullscreen=$(
    hyprctl activewindow -j | jq ". | select(.workspace.id==$workspace_curr) | .fullscreen")
[ $activewindow_fullscreen == 2 ] && echo true || echo false
