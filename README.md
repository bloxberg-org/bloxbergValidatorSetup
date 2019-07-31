# bloxbergValidatorSetup
This is a Docker image for running a validator node on the bloxberg blockchain. 

Remote Machine Minimum System Requirements:
* Ubuntu 16.04 or 18.04 Image (Other Operating Systems can work, but commands may have to be altered)
* Minimum 2 CPU
* Minimum 2GB RAM Memory
* Anything > 8GB SSD will be good, but may need to be upgraded in the future

These are simply the minimum requirements and we do recommend to allocate more resources to ensure stability.

Additionally, the blockchain connects to other nodes via port 30303, so it is important this port is open via your firewall beforehand.

## Setup Process

1. Clone the repository to the server you are hosting the validator node.
2. Edit the validator.yml with a text editor (nano or vim) and change the NATIP variable to your external IP. Save this file
3. Run 'sudo ./setup.sh'.
4. Run 'docker-compose -f validator.yml up'. This will start the docker container and generate an ethereum address and an enode address. Send these both to the bloxberg consortium.
5. Use Ctrl+C to shut down the docker container. Lastly, run 'docker-compose -f validator.yml up -d'. This will daemonize the container and start running the validator node in the background.
