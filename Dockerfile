# Use a valid OpenJDK 17 image
FROM openjdk:17-slim

# Set working directory
WORKDIR /app

# Copy Maven build JAR into the image
COPY target/myapp-1.0-SNAPSHOT.jar app.jar

# Command to run your app
ENTRYPOINT ["java","-jar","app.jar"]
