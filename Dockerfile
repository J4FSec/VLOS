FROM kalilinux/kali-rolling:latest

RUN apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" update
RUN apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
RUN apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install kali-linux-core
RUN apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install kali-tools-top10
RUN apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install kali-desktop-xfce
RUN apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install tightvncserver dbus dbus-x11 novnc net-tools


ENV USER root
ENV VNCEXPOSE 0
ENV VNCPORT 5900
ENV VNCPWD HaccZeHub
ENV VNCDISPLAY 1920x1080
ENV VNCDEPTH 16
ENV NOVNCPORT 8080

COPY entry.sh /entry.sh
RUN chmod +x /entry.sh

ENTRYPOINT [ "/entrypoint.sh" ]
