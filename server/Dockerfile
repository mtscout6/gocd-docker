FROM ubuntu:14.04
MAINTAINER Matt Smith, mtscout6@gmail.com

RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
  wget \
  curl \
  git \
  unzip \
  openjdk-7-jre-headless \
  && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN wget -O /tmp/gocd-server.deb http://download.go.cd/gocd-deb/go-server-14.2.0-377.deb \
  && apt-get update -y \
  && sudo dpkg -i /tmp/gocd-server.deb \
  && rm /tmp/gocd-server.deb \
  && rm -rf /var/lib/apt/lists/*

# INSTALL PLUGINS
RUN mkdir -p /var/lib/go-server/plugins/external \
  && wget -O /var/lib/go-server/plugins/external/go-npm-poller.jar  https://github.com/varchev/go-npm-poller/releases/download/0.2.0/go-npm-poller.jar \
  && chown go -R /var/lib/go-server

# GO SERVER PORT
EXPOSE 8153

# GO SERVER SSL PORT
EXPOSE 8154

ADD cruise-config.xml /etc/go/cruise-config.xml
RUN chown go /etc/go/cruise-config.xml

# TODO: Look at using spupervisord to keep the container running, or use something like kubernetes?
CMD /etc/init.d/go-server start && tail -f /var/log/go-server/go-server.log
