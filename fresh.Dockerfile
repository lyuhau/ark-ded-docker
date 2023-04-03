FROM lyuhau/ark-ded:base

EXPOSE 27015/udp
EXPOSE 7777/udp
EXPOSE 7778/udp
EXPOSE 32330/tcp

USER root
RUN replace_spaces() { \
      echo -n "$1" | perl -pe 's/ /\\\\040/g'; \
    }; \
    setup_link() { \
      case "$1" in \
        "-d") \
          install -o steam -g steam -D -d "$2"; \
          su steam -c "install -o steam -g steam -D -d '$3'"; \
          echo "$(replace_spaces "$2") $(replace_spaces "$3") none defaults,bind,user 0 0" >> /etc/fstab;; \
        "-f") \
          install -o steam -g steam -D /dev/null "$2"; \
          su steam -c "install -o steam -g steam -D -d '$(dirname "$3")'"; \
          su steam -c "ln -s '$2' '$3'";; \
      esac; \
    }; \
    setup_link -d "/mnt/ark-ded/instance/config"    "/home/steam/config/instance" && \
    setup_link -d "/mnt/ark-ded/instance/SavedArks" "/home/steam/Steam/steamapps/common/ARK Survival Evolved Dedicated Server/ShooterGame/Saved/SavedArks" && \
    setup_link -d "/mnt/ark-ded/common/cluster"     "/home/steam/Steam/steamapps/common/ARK Survival Evolved Dedicated Server/ShooterGame/Saved/clusters/cluster" && \
    setup_link -d "/mnt/ark-ded/common/Config"      "/home/steam/Steam/steamapps/common/ARK Survival Evolved Dedicated Server/ShooterGame/Saved/Config" && \
    setup_link -f "/mnt/ark-ded/mods/modlist.ini"   "/home/steam/config/modlist.ini" && \
    setup_link -d "/mnt/ark-ded/mods/Mods"          "/home/steam/Steam/steamapps/workshop/content/346110" && \
    chown steam:steam -R /mnt/ark-ded
USER steam

COPY server-start.sh install-mods.sh /home/steam/
WORKDIR /home/steam
CMD ["/home/steam/server-start.sh"]
