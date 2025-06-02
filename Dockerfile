FROM openjdk:11-jre-slim

WORKDIR /app

COPY target/simple-java-app-1.0-SNAPSHOT.jar /app/simple-java-app.jar

ENTRYPOINT ["java", "-jar", "/app/simple-java-app.jar"]
