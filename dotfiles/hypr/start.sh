#!/usr/bin/env bash

swww-daemon & 

swww img ~/nixos-config/wallpapers/nix-tomorrow-dark.png &

nm-applet --indicator &

# Status bar
waybar &

mako --border-radius 10 --border-size 2 --background-color \#24273a --border-color \#b7bdf8
