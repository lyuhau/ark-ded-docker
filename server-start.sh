#!/usr/bin/env bash

# Where the server executable is
binary="/home/steam/Steam/steamapps/common/ARK Survival Evolved Dedicated Server/ShooterGame/Binaries/Linux/ShooterGameServer"

# Map name e.g. TheIsland
map="$(cat config/instance/instance-map)"

# Options for the server instance
# instance-opts.ini and server-opts.ini used here
mod_opts="?GameModIds=$(<config/modlist.ini perl -0777pe 's/\s*#.*//g; s/\R+/\n/g; s/^\R|\R$//g; s/\R/,/g')"
instance_opts="$(<config/instance/instance-opts.ini perl -0777pe 's/\s*#.*//g; s/^AltSaveDirectoryName=.*//m; s/\R+/\n/g; s/\R$|^\R//g; s/\R/?/g')"
server_opts="$(<config/instance/server-opts.ini perl -0777pe 's/\s*#.*//g; s/^clusterid=.*//m; s/\R+/\n/g; s/\R$|^\R//g; s/^(?!$)/-/mg; s/\R/ /g')"

# Log the command and execute it
echo "$binary" "$map?listen?$instance_opts$mod_opts" $server_opts
"$binary" "$map?listen?$instance_opts$mod_opts" $server_opts
