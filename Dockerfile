FROM kalilinux/kali-rolling:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN echo "wireshark-common wireshark-common/install-setuid boolean true" | sudo debconf-set-selections
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install kali-linux-core
RUN apt-get -y install kali-tools-top10
RUN apt-get -y install kali-desktop-xfce
RUN apt-get -y install tightvncserver dbus dbus-x11 novnc net-tools


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
