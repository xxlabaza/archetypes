
FROM  openjdk:11.0.7-jre-slim
LABEL maintainer="Artem Labazin <xxlabaza@gmail.com>"

ENTRYPOINT ["java", "-jar", "/app.jar"]

ARG JAR_FILE
ADD ${JAR_FILE} /app.jar
