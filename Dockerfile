FROM ubuntu:20.04
ARG DOCKER_UID=1000
ARG DOCKER_USER=is-user
ARG DOCKER_PASSWORD=is-user
ADD ./etc/timezone /etc
RUN apt-get update
RUN apt-get install -y tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN apt-get install -y\
  build-essential\
  dnsutils\
  emacs\
  file\
  git\
  iputils-ping\
  net-tools\
  sudo\
  telnet\
  traceroute\
  vim\
  wget\
  zip
RUN useradd -m --uid ${DOCKER_UID} --groups sudo ${DOCKER_USER} \
  && echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd
USER ${DOCKER_USER}
WORKDIR /home/${DOCKER_USER}
