#!/bin/bash
set -e

BUNDLETOOL=/root/bundletool.jar
AAB=/root/app-release.aab
OUTAPK=/root/app.apk

if [ ! -f $BUNDLETOOL ]; then
  wget https://github.com/google/bundletool/releases/download/1.17.2/bundletool-all-1.17.2.jar -O $BUNDLETOOL
fi

if [ -f $AAB ]; then
  TMPDIR=$(mktemp -d)
  java -jar $BUNDLETOOL build-apks --bundle=$AAB --output=$TMPDIR/app.apks --mode=universal
  unzip -o $TMPDIR/app.apks -d $TMPDIR
  mv $TMPDIR/universal.apk $OUTAPK
  rm -rf $TMPDIR
  echo "[ok] universal.apk 생성 완료: $OUTAPK"
else
  echo "[warn] app-release.aab 없음, 변환 skipped"
fi
