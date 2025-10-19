#!/bin/bash
set -e

export ANDROID_SDK_ROOT=/opt/android-sdk
export PATH=$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$PATH

# VNC 실행
/root/start-vnc.sh &

# Android Emulator 실행
emulator -avd android12-play -noaudio -no-boot-anim -gpu swiftshader_indirect -verbose &
sleep 40  # 부팅 대기

# APK 설치 (AAB 없으면 skip)
[root]/bundletool.sh
[root]/install-app.sh

# 컨테이너 유지
tail -f /dev/null
