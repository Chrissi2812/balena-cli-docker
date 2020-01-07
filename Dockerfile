FROM ubuntu:bionic

# install apt dependencies (no need for Node or npm here)
RUN apt-get update && apt-get install -y curl git python g++ make

# use nvm to install node 8 or node 10 (v10 preferred, v8.16.0 works too)
ENV NODE_VERSION v10.18.0
ENV NVM_DIR /usr/local/nvm
ENV PATH $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
RUN /bin/bash -c "source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm use $NODE_VERSION"

# install balena-cli
RUN npm install balena-cli -g --production --unsafe-perm
