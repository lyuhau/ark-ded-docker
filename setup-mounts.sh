#!/usr/bin/env bash

</etc/fstab perl -0777pe 's/ +/ /g; s/\s*#.*//g; s/^\R|\R$//g' | cut -d' ' -f2 | perl -pe 's/\\040/ /g' | while read d; do mount "$d"; done
