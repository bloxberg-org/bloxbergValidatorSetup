#!/bin/bash

start () {
	keypairs=(`ls /home/parity/.local/share/io.parity.ethereum/bloxbergData/keys/Bloxberg/UTC*`)

	if [[ -z "${NAT_IP}" ]]
	then
		NAT_IP_STRING=""
	else
		NAT_IP_STRING="extip:${NAT_IP}"
	fi

	if [ -f "/engine_signer" ]
	then
		ENGINE_SIGNER=`cat /engine_signer`
	fi

	if [ -f "/debug" ]
	then
		DEBUG="-l sync,network"
	fi  

	if [ -e "${keypairs[0]}" ]
	then
		echo "Keypair is present, skipping account generation"
		if [[ -z ${AUTH_ADDRESS} ]]
		then
			KEYPAIR_FILE=`ls -1tr /home/parity/.local/share/io.parity.ethereum/bloxbergData/keys/Bloxberg/UTC* | head -1`
			ENGINE_SIGNER='0x'`cat ${KEYPAIR_FILE} | awk -F 'address":"' '{print $2}' | awk -F '"' '{print $1}'`
		else
			ENGINE_SIGNER='0x'${AUTH_ADDRESS}
		fi
	else
		cp /validator.tpl /home/parity/.local/share/io.parity.ethereum/validator.toml
		ENGINE_SIGNER=`parity --config /home/parity/.local/share/io.parity.ethereum/validator.toml account new  2>&1 | grep 0x`
		echo "Generated keypair: ${ENGINE_SIGNER}"
		echo ${ENGINE_SIGNER} > /engine_signer
	fi


	cat /validator.tpl | sed s/"__ENGINE_SIGNER__"/${ENGINE_SIGNER}/ | sed s/"__NAT_IP__"/${NAT_IP_STRING}/ > /home/parity/.local/share/io.parity.ethereum/validator.toml

	echo "Using Authority Address: ${ENGINE_SIGNER}"

	parity --config /home/parity/.local/share/io.parity.ethereum/validator.toml $DEBUG
}

resync () {
	rm -rf /home/parity/.local/share/io.parity.ethereum/bloxbergData/chains
	rm -rf /home/parity/.local/share/io.parity.ethereum/bloxbergData/cache
	wget https://raw.githubusercontent.com/bloxberg-org/bloxbergValidatorSetup/master/validator/bootnodes.txt -O /home/parity/.local/share/io.parity.ethereum/bootnodes.txt 
}

debug () {
	if [ -f "/debug" ]
	then
		rm -rf /debug;
		echo "Debug mode disbled";
	else
		touch /debug;
		echo "Debug mode enabled";
	fi
}

while test $# -gt 0
do
	case "$1" in
		--start) start;
			;;
		--resync) resync;
			;;
		--debug) debug;
			;;
		--*) echo "invalid option $1"
			;;
		*) echo "invalid argument $1"
			;;
	esac
	shift
done
