FROM ubuntu:22.04
RUN apt-get update && apt-get install -y openjdk-17-jdk android-sdk git sdkmanager
ENV ANDROID_HOME /usr/lib
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
RUN yes | sdkmanager --licenses # Accept all SDK licenses
WORKDIR /app
COPY . /app
RUN chmod +x gradlew
RUN ./gradlew build