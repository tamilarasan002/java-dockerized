# Use UBI base image with OpenJDK 8
FROM registry.redhat.io/ubi8/openjdk-8:latest

# Set the working directory
WORKDIR /app/java_project/

# Copy the JAR file
COPY target/dockerized-0.0.1-SNAPSHOT.jar ./

# Copy dependencies
COPY target/dependency-jars/* ./dependency-jars/

# Copy input data
COPY src/test/resources/file.txt /tmp/docker/input/

# Copy log4j2 configuration
COPY src/main/resources/log4j2.xml ./log4j2.xml

# Set up volumes
VOLUME ["/tmp/docker/input", "/tmp/docker/output", "/tmp/docker/data/logs"]

# Run the JAR file with specified log4j2 configuration
CMD ["java", "-Dlog4j.configurationFile=/app/java_project/log4j2.xml", "-jar", "dockerized-0.0.1-SNAPSHOT.jar"]
