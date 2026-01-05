# Use Eclipse Temurin Java 17 base image
FROM eclipse-temurin:17-jdk-jammy

# Set working directory
WORKDIR /app

# Copy Maven JAR into the image
COPY target/myapp-1.0-SNAPSHOT.jar app.jar

# Run the JAR
ENTRYPOINT ["java","-jar","app.jar"]
