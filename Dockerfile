FROM node:latest
MAINTAINER Darwin Monroy <contact@darwinmonroy.com>

RUN apt-get update \
  && apt-get install -y \
    build-essential \
    curl \
    git-core \
    gzip \
    libssl-dev \
    pkg-config \
    python \
  && cd /opt \
  && git clone https://github.com/ether/etherpad-lite.git etherpad

RUN cd /opt/etherpad \
  && npm install mongodb \
  && bin/installDeps.sh

# Add conf files
ADD settings.json /opt/etherpad/default.settings.json

WORKDIR /opt/etherpad
CMD ["node", "node_modules/ep_etherpad-lite/node/server.js"]
