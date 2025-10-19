#!/bin/bash
set -e
Xvfb :0 -screen 0 1280x720x16 &
export DISPLAY=:0
fluxbox &
x11vnc -display :0 -nopw -listen localhost -xkb -forever &
websockify --web=/usr/share/novnc/ 6080 localhost:5900
