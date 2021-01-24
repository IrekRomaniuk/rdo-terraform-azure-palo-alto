# https://gist.github.com/gsweene2/aa4229c163d500965e5674ee4418bf7a
# Pull base image.
FROM ubuntu:latest

RUN \
# Update
apt-get update -y && \
# Install Unzip
apt-get install unzip -y && \
# need wget
apt-get install wget -y && \
# need curl
apt install curl -y && \
# vim
apt-get install vim -y

################################
# Install Terraform
################################

# Download terraform for linux
RUN wget https://releases.hashicorp.com/terraform/0.13.6/terraform_0.13.6_linux_amd64.zip

# Unzip
RUN unzip terraform_0.13.6_linux_amd64.zip

# Move to local bin
RUN mv terraform /usr/local/bin/
# Check that it's installed
RUN terraform --version 

################################
# Install python
################################

RUN apt-get install -y python3-pip
#RUN ln -s /usr/bin/python3 python
RUN pip3 install --upgrade pip
RUN python3 -V
RUN pip --version

################################
# Install requirements
################################

COPY requirements.txt .
RUN pip3 install -r requirements.txt

################################
# Install Ansible with Palo modules
################################

RUN pip3 install ansible
RUN ansible-galaxy collection install paloaltonetworks.panos
