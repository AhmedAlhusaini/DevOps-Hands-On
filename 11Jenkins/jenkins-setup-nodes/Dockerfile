# Use the official Ubuntu base image
FROM ubuntu:20.04

# Avoid interactive prompts during package install ENV DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND=noninteractive
# Update package lists and install OpenJDK 8, OpenSSH server, and Maven
RUN apt-get update -qy && \
    apt-get install openjdk-8-jdk -qy && \
    apt-get install openssh-server -qy && \
    apt-get install -qy maven

# Install Git, modify PAM configuration to avoid login UID issues,
# and create the SSH daemon directory
RUN apt-get install -qy git && \
    sed -i 's|session    required    pam_loginuid.so|session    optional    pam_loginuid.so|' /etc/pam.d/sshd && \
    mkdir -p /var/run/sshd

# Create a new user named 'jenkins' with a home directory and bash shell,
# then set the password to 'jenkins'
RUN useradd -ms /bin/bash jenkins --home /home/jenkins && \
    echo "jenkins:jenkins" | chpasswd

# Expose port 22 for SSH access
EXPOSE 22

# Start the SSH daemon in the foreground
CMD ["/usr/sbin/sshd", "-D"]

#docker build -t custom-jenkins-agent .
#docker run -d --name jenkins-agent01 custom-jenkins-agent
#docker exec -it jenkins-agent01 bash
