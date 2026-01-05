FROM openjdk:17-jdk-slim
COPY target/myapp.jar myapp.jar
ENTRYPOINT ["java","-jar","/myapp.jar"]
