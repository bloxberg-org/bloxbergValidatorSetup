FROM parity/parity:v2.7.2-stable
USER root

ADD start.sh validator.tpl /
RUN apt-get update
RUN apt-get -y install sed
