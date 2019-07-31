# bloxbergValidatorSetup


1. Clone the repository to the server you are hosting the validator node.
2. Edit the validator.yml with a text editor (nano or vim) and change the NATIP variable to your external IP. Save this file
3. Run 'sudo ./setup.sh'.
4. Run 'docker-compose -f validator.yml up'. This will start the docker container and generate an ethereum address and an enode address. Send these both to the bloxberg consortium.
5. Use Ctrl+C to shut down the docker container. Lastly, run 'docker-compose -f validator.yml up -d'. This will daemonize the container and start running the validator node in the background.
