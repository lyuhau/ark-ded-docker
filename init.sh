#!/usr/bin/env bash

# fstab contains the mappings from Docker mounted folders to ARK folders
./setup-mounts.sh

#
# instance-opts.ini, server-opts.ini, and modlist.ini are in the ark-ded-template repo
# Those files have comments regarding the expected format
# The perl scripts here convert the contents of those files into the correct format for their corresponding commands
#
./install-mods.sh

# Parse run options and run
./server-start.sh
