#!/bin/bash

check_packages() {

	if [ $(grep -i debian /etc/*-release | wc -l) -gt 0 ]; then
		if [ ! -f /usr/bin/docker ]; then
			echo "INSTALLING DOCKER"
			sudo apt-get install -y docker-ce
		fi

		if [ ! -f /usr/local/bin/docker-compose ]; then
			echo "INSTALLING DOCKER-COMPOSE"
			sudo apt-get install docker-compose
		fi
	fi
	

	#Chrony configuration
	sudo apt install chrony
	cat /src/chronyConfig.tpl > /etc/chrony/chrony.conf
	sudo systemctl enable chrony
	sudo systemctl restart chrony
	sudo systemctl start chronyd
	sudo chown -R 1000:1000 ./validator
}


check_packages
