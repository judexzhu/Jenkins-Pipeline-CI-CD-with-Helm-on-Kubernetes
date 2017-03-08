FROM jenkins:latest

USER root
RUN apt-get update \
      && apt-get install -y sudo apt-transport-https software-properties-common \
      && curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - \
      && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"\
      && apt-get update -y \
      && apt-get install docker-ce -y \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
