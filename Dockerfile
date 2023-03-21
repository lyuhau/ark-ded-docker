FROM cm2network/steamcmd:latest

RUN ./steamcmd.sh +login anonymous +app_update 376030 +quit
EXPOSE 27015/udp
EXPOSE 7777/udp
EXPOSE 7778/udp
EXPOSE 32330/tcp

COPY server-start.sh /home/steam
WORKDIR /home/steam
CMD ["/home/steam/server-start.sh"]
