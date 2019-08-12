FROM ubuntu:16.04

ENV ANDROID_HOME="/var/opt/android"
ENV PATH="/var/opt/gradle/2.14/bin:/var/opt/android/tools:/var/opt/android/tools/bin:/var/opt/android/platform-tools:/var/opt/android/platform-tools/bin:${PATH}"

RUN apt-get update

RUN apt-get install -y curl git software-properties-common unzip python-software-properties

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g cordova ionic
RUN apt-get install -y openjdk-8-jdk openjdk-8-jre

WORKDIR /var/opt

RUN curl -o sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
RUN unzip sdk-tools.zip -d android

RUN sdkmanager --update
RUN yes | sdkmanager "build-tools;26.0.2"
RUN yes | sdkmanager "platforms;android-27"
RUN sdkmanager "tools"

RUN curl -o gradle-2.14-bin.zip https://downloads.gradle.org/distributions/gradle-2.14-bin.zip
RUN unzip gradle-2.14-bin.zip -d gradle
RUN mv gradle/gradle-2.14 gradle/2.14

WORKDIR /root
