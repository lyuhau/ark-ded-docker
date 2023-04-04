#!/usr/bin/env bash

# Make sure server is up to date and install/update mods
# modlist.ini used here
mod_list="$(<"config/modlist.ini" perl -0777pe 's/\s*#.*//g; s/^//mg; s/\R+/\n/g; s/\R$|^\R//g;')"
mod_command="$(<<<"$mod_list" perl -0777pe 's/^(?!$)/+workshop_download_item 346110 /mg; s/\R/ /g')"
./steamcmd/steamcmd.sh +login anonymous +app_update 376030 $mod_command +quit

# Symlink the mod folders from the ARK installation to the ARK dedicated server installation
while read mod_id; do
  source_file="/home/steam/Steam/steamapps/workshop/content/346110/$mod_id"
  target_file="/home/steam/Steam/steamapps/common/ARK Survival Evolved Dedicated Server/ShooterGame/Content/Mods/$mod_id"
  if [[ ! -e "$target_file" ]]; then
    cp -rf "$source_file" "$target_file"
    echo "Copied mod folder: $target_file"
  else
    echo "Already exists: $target_file"
  fi
done <<<"$mod_list"

cp /mnt/ark-ded/modfiles/* "/home/steam/Steam/steamapps/common/ARK Survival Evolved Dedicated Server/ShooterGame/Content/Mods/"
