FROM openjdk:8-jdk-alpine

ENV PATH="/usr/local/sbt/bin:$PATH"

RUN apk update && \
    apk add --no-cache --virtual=.build-dependencies wget ca-certificates bash && \
    mkdir -p "/app/" && \
    mkdir -p "/usr/local/sbt" && \
    wget -qO - "https://piccolo.link/sbt-1.3.8.tgz" | tar xz -C ./usr/local/sbt --strip-components=1 && \
    sbt sbtVersion

WORKDIR /app
