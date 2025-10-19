# Web Android Emulator (Android 12 + Google Play)

Docker + noVNC 환경에서 브라우저로 Android 12 실행 가능.

## 빌드
docker build -t web-android-emulator .

## 실행
docker run -it -p 6080:6080 web-android-emulator

## 접속
http://localhost:6080
