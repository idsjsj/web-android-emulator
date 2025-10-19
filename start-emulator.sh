#!/bin/bash
set -e

export ANDROID_SDK_ROOT=/opt/android-sdk
export PATH=$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$PATH

echo "[start] 가상 디스플레이 & VNC 실행 중..."
/root/start-vnc.sh &

echo "[start] Android 에뮬레이터 부팅 중..."
emulator -avd android12-play -noaudio -no-boot-anim -gpu swiftshader_indirect -verbose &

sleep 40
echo "[ok] Android 에뮬레이터 부팅 완료"

# 컨테이너 유지
tail -f /dev/null
