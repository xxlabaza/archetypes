FROM  amd64/openjdk:17-jdk-slim-buster
# FROM  arm64v8/openjdk:17-jdk-slim-buster
LABEL maintainer="Artem Labazin <xxlabaza@gmail.com>"

ENTRYPOINT ["java", "-jar", "/app.jar"]

ARG JAR_FILE
ADD ${JAR_FILE} /app.jar
