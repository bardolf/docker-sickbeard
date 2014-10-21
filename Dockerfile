FROM ubuntu:14.04
#Thanks to https://github.com/user419/docker-sickbeard and https://github.com/GeoffreyPlitt/docker-sickbeard
MAINTAINER Tim Haak <tim@haak.co.uk>

ENV SICKBEARD_VERSION build-506

RUN apt-get -q update && \
	apt-get -qy --force-yes dist-upgrade

RUN apt-get install -qy --force-yes python-cheetah
RUN apt-get install -qy --force-yes wget tar ca-certificates curl

RUN curl -L https://github.com/midgetspy/Sick-Beard/tarball/$SICKBEARD_VERSION -o sickbeard.tgz && \
	tar -xvf sickbeard.tgz -C / && \
	mv /midgetspy-Sick-Beard-* /sickbeard

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 8081

CMD ["/start.sh"]
