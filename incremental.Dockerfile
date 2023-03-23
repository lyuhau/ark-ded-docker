FROM lyuhau/ark-ded:incremental

RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +app_update 376030 +quit
