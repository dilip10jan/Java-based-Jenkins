Use a lightweight OpenJDK 11 runtime image

FROM openjdk:11-jre-slim

Set the working directory inside the container

WORKDIR /app

Copy the JAR file from the Maven build to the container

COPY target/simple-java-app-1.0-SNAPSHOT.jar /app/simple-java-app.jar

Define the command to run the application

ENTRYPOINT ["java", "-jar", "/app/simple-java-app.jar"]
