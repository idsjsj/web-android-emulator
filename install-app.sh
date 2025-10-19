#!/bin/bash
set -e

APK=/root/app.apk
export PATH=$PATH:/opt/android-sdk/platform-tools

adb wait-for-device

if [ -f $APK ]; then
  adb install -r $APK || echo "[warn] APK 설치 실패"
else
  echo "[warn] universal.apk 없음, 설치 skipped"
fi
