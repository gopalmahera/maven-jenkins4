# Stage 1: Builder
FROM maven:3.9.5-eclipse-temurin-17-slim AS builder

# Set the working directory
WORKDIR /app

# Copy the Maven project files
COPY . .

# Build the application
RUN mvn package

# Stage 2: Runtime
FROM tomcat:10.1-jdk17-temurin

WORKDIR  /usr/local/tomcat/webapps

# Copy the WAR file from the builder stage to Tomcat
COPY --from=builder /app/webapp/target/*.war .

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
