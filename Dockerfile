FROM ubuntu:20.04

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    wget \
    unzip \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/local/

# Download and install Ant Media Server Community Edition
RUN wget https://github.com/ant-media/Ant-Media-Server/releases/download/ams-v2.5.3/ant-media-server-community-2.5.3.zip \
    && unzip ant-media-server-community-2.5.3.zip \
    && rm ant-media-server-community-2.5.3.zip

# Set working directory to Ant Media Server
WORKDIR /usr/local/ant-media-server

# Expose required ports
EXPOSE 5080 1935 5443 5554 8888

# Set execution permissions and entrypoint
RUN chmod +x start.sh
CMD ["./start.sh"]
