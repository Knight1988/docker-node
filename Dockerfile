FROM ubuntu:20.04

SHELL ["/bin/bash", "--login", "-i", "-c"]

RUN apt-get update 
RUN apt-get install -y curl
RUN apt-get install -y zip
RUN apt-get install -y rsync
RUN apt-get install -y python
RUN apt-get install -y build-essential

ENV NODE_VERSION=0.12.7
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version
VOLUME /app