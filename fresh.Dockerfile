FROM lyuhau/ark-ded:base

EXPOSE 27015/udp
EXPOSE 7777/udp
EXPOSE 7778/udp
EXPOSE 32330/tcp

RUN mkdir -p "/home/steam/Steam/steamapps/common/ARK Survival Evolved Dedicated Server/ShooterGame/Saved/SavedArks" && \
    mkdir -p "/home/steam/Steam/steamapps/common/ARK Survival Evolved Dedicated Server/ShooterGame/Saved/clusters/cluster"

COPY server-start.sh /home/steam
WORKDIR /home/steam
CMD ["/home/steam/server-start.sh"]
