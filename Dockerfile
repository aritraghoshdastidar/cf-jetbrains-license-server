FROM java:8-jre
MAINTAINER Lars Gohr <larsgohr@gmail.com>

ENV LCSRV_HOME /usr/bin/jetbrains/license-server

RUN wget https://download.jetbrains.com/lcsrv/license-server-installer.zip \
 && mkdir -p $LCSRV_HOME \
 && unzip license-server-installer.zip -d $LCSRV_HOME \
 && $LCSRV_HOME/bin/license-server.sh configure --jetty.virtualHosts.names=54.210.79.204

ADD entrypoint.sh /entrypoint.sh

EXPOSE 8111

WORKDIR $LCSRV_HOME

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
