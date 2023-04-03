#!/usr/bin/env bash

</etc/fstab perl -0777pe 's/ +/ /g; s/\s*#.*//g; s/^\R|\R$//g' | cut -d' ' -f2 | perl -pe 's/\\040/ /g' | while read d; do mount "$d"; done

#
# instance-opts.ini, server-opts.ini, and modlist.ini are in the ark-ded-template repo
# Those files have comments regarding the expected format
# The perl scripts here convert the contents of those files into the correct format for their corresponding commands
#
./install-mods.sh

# Where the server executable is
binary="/home/steam/Steam/steamapps/common/ARK Survival Evolved Dedicated Server/ShooterGame/Binaries/Linux/ShooterGameServer"

# Map name e.g. TheIsland
map="$(cat config/instance/instance-map)"

# Options for the server instance
# instance-opts.ini and server-opts.ini used here
instance_opts="$(<config/instance/instance-opts.ini perl -0777pe 's/\s*#.*//g; s/^AltSaveDirectoryName=.*//m; s/\R+/\n/g; s/\R$|^\R//g; s/\R/?/g')"
server_opts="$(<config/instance/server-opts.ini perl -0777pe 's/\s*#.*//g; s/^clusterid=.*//m; s/\R+/\n/g; s/\R$|^\R//g; s/^(?!$)/-/mg; s/\R/ /g')"

# Log the command and execute it
echo "$binary" "$map?listen?$instance_opts" $server_opts
"$binary" "$map?listen?$instance_opts" $server_opts
