FROM parity/parity:v2.5.13-stable
USER root

ADD start.sh validator.tpl /
RUN apt-get update
RUN apt-get -y install sed
