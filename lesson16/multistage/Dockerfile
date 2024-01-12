FROM gradle:8.5.0-jdk11 AS builder
COPY --chown=gradle:gradle ./log4shell-vulnerable-app /home/gradle/src
RUN ls -la /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle shadowJar --no-daemon


FROM openjdk:23-ea-4-jdk-slim-bullseye
EXPOSE 8888
RUN mkdir /app
COPY --from=builder /home/gradle/src/build/libs/*.jar /app/log4shell-vulnerable-app-all.jar
CMD ["java", "-jar", "/app/log4shell-vulnerable-app-all.jar"]
