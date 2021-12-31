FROM ubuntu:20.04

SHELL ["/bin/bash", "--login", "-i", "-c"]

RUN apt-get update && apt-get install -y curl zip rsync

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
RUN source /root/.bashrc && nvm install 0.12.7 && nvm alias default 0.12.7