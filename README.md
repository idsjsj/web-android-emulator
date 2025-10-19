# Web Android Emulator (Android 12 + Google Play)

## 실행

1. Docker 빌드
docker build -t web-android-emulator .

markdown
코드 복사

2. Docker 실행
docker run -it -p 6080:6080 web-android-emulator

markdown
코드 복사

3. 브라우저 접속
http://localhost:6080

arduino
코드 복사

APK 자동 설치는 app-release.aab가 존재할 경우 수행됩니다.
