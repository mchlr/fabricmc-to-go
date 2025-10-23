# Use a suitable base image with Java installed (Java 21 is recommended for 1.20.5+)
FROM eclipse-temurin:21-jre-jammy

# Set the working directory inside the container
# This is the directory that will contain your server files and world data.
WORKDIR /data

# Install 'screen' for detached terminal-like sessions if needed (optional but useful)
RUN apt-get update && \
    apt-get install -y screen && \
    rm -rf /var/lib/apt/lists/*

# Expose the default Minecraft port
EXPOSE 25565

# Command to run the Minecraft server with 16GB of RAM.
# IMPORTANT: Replace 'fabric-server.jar' with the exact name of the Fabric executable JAR
# you place in your ~/minecraft/ directory.
CMD ["java", "-Xmx16G", "-Xms16G", "-jar", "fabric-server.jar", "nogui"]
