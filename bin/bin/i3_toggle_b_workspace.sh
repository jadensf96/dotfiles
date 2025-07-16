#!/bin/bash

# Get the name of the current workspace from i3-msg
CURRENT_WORKSPACE=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

# The name of our special workspace
B_WORKSPACE="b"

# Check if the current workspace is the 'b' workspace
if [ "$CURRENT_WORKSPACE" = "$B_WORKSPACE" ]; then
    # If we are on the 'b' workspace, go back to the previous one
    i3-msg workspace back_and_forth
else
    # If we are not on the 'b' workspace, switch to it
    i3-msg workspace "$B_WORKSPACE"
fi
