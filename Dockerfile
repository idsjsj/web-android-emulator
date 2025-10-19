FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

# 필수 패키지 설치
RUN apt-get update && apt-get install -y \
    wget unzip openjdk-17-jdk adb xvfb x11vnc fluxbox novnc websockify git curl tzdata \
    && rm -rf /var/lib/apt/lists/*

# Android SDK 설치
ENV ANDROID_SDK_ROOT=/opt/android-sdk
RUN mkdir -p $ANDROID_SDK_ROOT && cd /opt && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip && \
    unzip commandlinetools-linux-11076708_latest.zip -d $ANDROID_SDK_ROOT/cmdline-tools && \
    mv $ANDROID_SDK_ROOT/cmdline-tools/cmdline-tools $ANDROID_SDK_ROOT/cmdline-tools/latest && \
    yes | $ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager --sdk_root=$ANDROID_SDK_ROOT --licenses

# Android 12 + Google Play System Image 설치
RUN yes | $ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager --sdk_root=$ANDROID_SDK_ROOT \
    "platform-tools" \
    "emulator" \
    "system-images;android-31;google_apis_playstore;arm64-v8a" \
    "platforms;android-31"

# AVD 생성
RUN echo "no" | $ANDROID_SDK_ROOT/cmdline-tools/latest/bin/avdmanager create avd \
    --name android12-play \
    --package "system-images;android-31;google_apis_playstore;arm64-v8a" \
    --device "pixel_5"

EXPOSE 6080

# 실행 스크립트 복사
COPY start-emulator.sh /root/start-emulator.sh
COPY start-vnc.sh /root/start-vnc.sh
COPY bundletool.sh /root/bundletool.sh
COPY install-app.sh /root/install-app.sh
RUN chmod +x /root/*.sh

CMD ["/root/start-emulator.sh"]
