#!/usr/bin/env bash

choice=$(printf "\uf011  poweroff\n\uf021  reboot\n\uf08b  logout" | rofi -dmenu -i -p "Power")

case "$choice" in
    *poweroff) systemctl poweroff ;;
    *reboot)   systemctl reboot ;;
    *logout)   loginctl terminate-user "$USER" ;;
esac
