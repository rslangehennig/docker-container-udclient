# Use the official image as a parent image.
# You need the udclient.zip and the ibm-java-* files to be in the same folder as the Dockerfile
#
FROM registry.redhat.io/ubi8
USER root
run yum --disableplugin=subscription-manager install unzip -y
# Set the working directory.
WORKDIR /tmp
# Copy the file from your host to your current location.
COPY udclient.zip .
COPY ibm-java-jre-8.0-6.0-linux-x86_64.tgz .
run unzip ./udclient.zip -d /opt/udclient
run rm ./udclient.zip
run tar xzf ibm-java-jre-8.0-6.0-linux-x86_64.tgz
run rm ibm-java-jre-8.0-6.0-linux-x86_64.tgz
run mkdir -p /opt/ibm
run mv ibm-java-x86* /opt/ibm
# Install git
yum update
yum install git
git --version
# Run the specified command within the container.
CMD [ "/bin/bash" ]
