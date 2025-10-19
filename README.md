# 🌐 Web Android Emulator

브라우저에서 Android 12 (Google Play 포함)를 실행할 수 있는 컨테이너 버전입니다.  
Docker + noVNC 기반으로, PC 없이도 웹에서 가상 안드로이드를 띄울 수 있습니다.

---

## 🚀 실행 방법

```bash
# 1️⃣ 빌드
docker build -t web-android-emulator .

# 2️⃣ 실행
docker run -p 6080:6080 web-android-emulator

# 3️⃣ 브라우저 접속
http://localhost:6080
