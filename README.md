# bloxbergBootnode


1. Clone the repository to the server you are hosting the bootnode.
2. CD into the './bootnode' folder and edit the bootnode.toml file with your text editor. Change the nat: setting to your external IP. Once done, save this file
3. Change the password in bootnode.pwd to a secure password.
4. Go back into the parent directory and run 'sudo ./setup.sh'.
5. Once complete, run 'docker-compose -f bootnode.yml up' This will start the bootnode. Ensure it is syncing and then you can close it with Ctrl+C.
6. Lastly, run 'docker-compose -f bootnode.yml up -d' to daemonize the node.
# bloxbergValidatorSetup
