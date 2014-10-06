FROM mtscout6/gocd-agent:latest
MAINTAINER Matt Smith, mtscout6@gmail.com

RUN curl -sL https://deb.nodesource.com/setup | bash - \
  && apt-get update -y \
  && apt-get install -y \
    nodejs \
    build-essential \
  && rm -rf /var/lib/apt/lists/*
