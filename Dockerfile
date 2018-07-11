FROM 32bit/ubuntu:16.04

ARG SRV1CV8_VERSION
ARG SRV1CREPO_PORT

ENV DEBIAN_FRONTEND noninteractive
ENV SRV1CV8_REPOSITORY /opt/1C/repository
ENV SRV1CV8_VERSION ${SRV1CV8_VERSION}
ENV SRV1CREPO_PORT ${SRV1CREPO_PORT}

RUN apt-get -qq update

ADD debs/1c-server-${SRV1CV8_VERSION}.tar /tmp/
RUN apt-get -qq update                      \
    && cd /tmp && dpkg -i *.deb && rm *.deb \
    && mkdir -p ${SRV1CV8_REPOSITORY} && chmod 777 ${SRV1CV8_REPOSITORY}

VOLUME ${SRV1CV8_REPOSITORY}

EXPOSE ${SRV1CREPO_PORT}

CMD /opt/1C/v8.3/i386/crserver -port ${SRV1CREPO_PORT} -d ${SRV1CV8_REPOSITORY}/${SRV1CV8_VERSION}
