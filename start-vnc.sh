#!/bin/bash
set -e

# 가상 디스플레이
Xvfb :0 -screen 0 1280x720x16 &
export DISPLAY=:0
fluxbox &

# x11vnc 서버
x11vnc -display :0 -nopw -listen localhost -xkb -forever &

# noVNC 웹 서버
websockify --web=/usr/share/novnc/ 6080 localhost:5900
