
FROM  openjdk:11.0.8-jre-slim-buster
LABEL maintainer="Artem Labazin <xxlabaza@gmail.com>"

ENTRYPOINT ["java", "-jar", "/app.jar"]

ARG JAR_FILE
ADD ${JAR_FILE} /app.jar
