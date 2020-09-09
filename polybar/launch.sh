#!/bin/bash

killall -q polybar

polybar cbar -c "$HOME/.config/polybar/config.ini" &
