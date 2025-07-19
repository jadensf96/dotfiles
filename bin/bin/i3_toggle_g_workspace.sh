#!/bin/bash

# Get the name of the current workspace from i3-msg
CURRENT_WORKSPACE=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

# The name of our special workspace
G_WORKSPACE="g"

# Check if the current workspace is the 'g' workspace
if [ "$CURRENT_WORKSPACE" = "$G_WORKSPACE" ]; then
    # If we are on the 'g' workspace, go back to the previous one
    i3-msg workspace back_and_forth
else
    # If we are not on the 'g' workspace, switch to it
    i3-msg workspace "$G_WORKSPACE"
fi
