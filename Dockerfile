FROM ubuntu:xenial

RUN echo "deb http://ppa.launchpad.net/ergw/xenial/ubuntu xenial main" > /etc/apt/sources.list.d/ergw-xenial-ppa.list
RUN echo "deb http://dl.bintray.com/roadrunnr/ergw xenial main" > /etc/apt/sources.list.d/ergw-xenial-bintray.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 58A14C3D
RUN apt-key adv --keyserver pool.sks-keyservers.net --recv-keys 379CE192D401AB61

RUN apt-get update && apt-get -y install iproute2 ergw-gtp-c-node nano
COPY pre-start.sh /etc/ergw-gtp-c-node/
COPY ergw-gtp-c-start.sh /usr/bin/
COPY default-vars.sh /etc/ergw-gtp-c-node/
COPY config/sys.config /opt/ergw-gtp-c-node/releases/1.3.0/
COPY config/vm.args /opt/ergw-gtp-c-node/releases/1.3.0/

CMD ["/usr/bin/ergw-gtp-c-start.sh"]
