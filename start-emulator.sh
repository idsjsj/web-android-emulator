#!/bin/bash
set -e
export ANDROID_SDK_ROOT=/opt/android-sdk
export PATH=$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$PATH

/root/start-vnc.sh &

emulator -avd android12-play -noaudio -no-boot-anim -gpu swiftshader_indirect -verbose &
sleep 40

/root/bundletool.sh
/root/install-app.sh

tail -f /dev/null
