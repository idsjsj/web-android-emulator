# Web Android Emulator (Android 12 + Google Play)
이 프로젝트는 Android 12 + Google Play 에뮬레이터를 Docker와 noVNC를 이용해 웹 브라우저에서 실행할 수 있도록 구성되어 있습니다. app-release.aab가 없어도 에뮬레이터 실행 가능하며, AAB 파일을 추가하면 APK 자동 설치까지 가능합니다.

## 1. Docker 이미지 빌드
```bash
docker build -t web-android-emulator .
