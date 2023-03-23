FROM cm2network/steamcmd:latest

RUN ./steamcmd.sh +login anonymous +app_update 376030 +quit
