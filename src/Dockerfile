FROM parity/parity:v2.5.7-stable
USER root

ADD init.sh validator.tpl /
RUN apt-get update
RUN apt-get -y install sed
