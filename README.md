# Web Android Emulator (Android 12 + Google Play)

Docker와 noVNC로 Android 12 + Google Play 에뮬레이터를 웹 브라우저에서 실행 가능.  
AAB 파일 없으면 APK 설치 단계는 건너뜀.

## 1. Docker 이미지 빌드
```bash
docker build -t web-android-emulator .
