FROM jenkins/jenkins:lts-jdk21

USER root

RUN apt-get update && apt-get install -y \
    curl \  
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

ENV ANDROID_HOME=/opt/android-sdk
ENV PATH="/opt/flutter/bin:${ANDROID_HOME}/cmdline-tools/latest/bin:${PATH}"

RUN git clone --depth 1 --branch 3.41.2 https://github.com/flutter/flutter.git /opt/flutter \
    && chown -R jenkins:jenkins /opt/flutter

RUN curl -o /tmp/tools.zip https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip \
    && unzip -q /tmp/tools.zip -d /tmp \
    && mkdir -p ${ANDROID_HOME}/cmdline-tools \
    && mv /tmp/cmdline-tools ${ANDROID_HOME}/cmdline-tools/latest \
    && rm /tmp/tools.zip \
    && yes | sdkmanager --licenses \
    && sdkmanager "platform-tools" "platforms;android-36" "build-tools;35.0.0" "ndk;28.2.13676358" \
    && chown -R jenkins:jenkins ${ANDROID_HOME}

USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt
