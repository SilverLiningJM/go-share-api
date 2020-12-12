FROM openjdk:15.0.1-jdk-slim

COPY target/goshare-0.0.1-SNAPSHOT.jar ./goshare.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "./goshare.jar"]