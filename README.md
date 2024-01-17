# bloxbergValidatorSetup
This is a Docker image for running a validator node on the bloxberg blockchain. 

Remote Machine Minimum System Requirements:
* Ubuntu 18.04 or 22.04 Image (Other Operating Systems can work, but commands may have to be altered)
* Minimum 4 CPU
* Minimum 4GB RAM Memory
* We recommend for future proofing at least 250 GB of SSD storage.

These are simply the minimum requirements and we do recommend to allocate more resources to ensure stability.

With the latest update to parity 2.7, it is also necessary for your server CPU to support aes. This can be found by running:

```
cat /proc/cpuinfo
```
on the server and checking in the flags column for aes.

Additionally, the blockchain connects to other nodes via port 30303, so it is important this port is open via your firewall beforehand.

In the `docker-compose.yml` you will also see the ports 8545 (JSON-RPC API) and 8546 (Web-Socket). These can be used to interact with blockchain via means of your local node but don't need to be accesible over the internet.

## Setup Process

1. Clone the repository to the server you are hosting the validator node.
2. Edit the validator.yml with a text editor (nano or vim) and change the NATIP variable to your external IP. Save this file
3. Edit the `validator/validator.pwd` file and insert a secure password. This will be used to encrypt your private key.
4. Run 'sudo ./setup.sh'.
5. Run 'docker-compose -f validator.yml up'. This will start the docker container and generate an ethereum address and an enode address. Send these both to the bloxberg consortium.
6. Use Ctrl+C to shut down the docker container. Lastly, run 'docker-compose -f validator.yml up -d'. This will daemonize the container and start running the validator node in the background.
