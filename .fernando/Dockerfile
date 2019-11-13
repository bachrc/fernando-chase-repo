FROM maven:3.6.2-jdk-11-slim

COPY . /app/fernando-chase
WORKDIR /app/fernando-chase

RUN mvn -B -s /usr/share/maven/ref/settings-docker.xml dependency:resolve
