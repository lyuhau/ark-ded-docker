#!/usr/bin/env bash

binary="/home/steam/Steam/steamapps/common/ARK Survival Evolved Dedicated Server/ShooterGame/Binaries/Linux/ShooterGameServer"

map="$(cat instance/instance-map)"
instance_opts="$(<instance/instance-opts.ini perl -0777pe 's/^#.*//mg; s/\R+/\n/g; s/\R$|^\R//g; s/\R/?/g')"
server_opts="$(<instance/server-opts.ini perl -0777pe 's/^#.*//mg; s/\R+/\n/g; s/\R$|^\R//g; s/^/-/mg; s/\R/ /g')"

echo "$binary" "$map?listen?$instance_opts" $server_opts
"$binary" "$map?listen?$instance_opts" $server_opts
