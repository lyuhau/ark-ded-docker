#!/usr/bin/env bash

# Where the server executable is
binary="/home/steam/Steam/steamapps/common/ARK Survival Evolved Dedicated Server/ShooterGame/Binaries/Linux/ShooterGameServer"

# Map name e.g. TheIsland
map="$(cat instance/instance-map)"

# Options for the server instance
# Parsed from instance-opts.ini and server-opts.ini in the ark-ded-docker repo
# Those files have comments regarding the expected format as well
# The perl scripts here convert the contents of those files into the correct format for the server command
instance_opts="$(<instance/instance-opts.ini perl -0777pe 's/#.*//mg; s/^AltSaveDirectoryName=.*//m; s/\R+/\n/g; s/\R$|^\R//g; s/\R/?/g')"
server_opts="$(<instance/server-opts.ini perl -0777pe 's/#.*//mg; s/^clusterid=.*//m; s/\R+/\n/g; s/\R$|^\R//g; s/^/-/mg; s/\R/ /g')"

# Log the command and execute it
echo "$binary" "$map?listen?$instance_opts" $server_opts
"$binary" "$map?listen?$instance_opts" $server_opts
