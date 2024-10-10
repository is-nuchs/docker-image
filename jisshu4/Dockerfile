FROM centos:centos7
ARG DOCKER_UID=1000
ARG DOCKER_USER=linuxtext
ARG DOCKER_PASSWORD=jisshu4
ADD ./etc/yum.conf /etc
ADD ./etc/sudoers.d/privacy /etc/sudoers.d
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    yum -y update && yum clean all
RUN yum reinstall -y $(yum list installed | cut -f1 -d " " | sed 's/\..*$//g' | grep -v '^[L|I].*ed$' | sed -z 's/\n/ /g')
RUN yum install -y \
    sudo \
    which \
    man \
    man-pages \
    man-pages-ja \
    man-pages-overrides \
    less
RUN yum reinstall -y glibc-common
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8" \
    TZ=Asia/Tokyo
RUN useradd -m --uid ${DOCKER_UID} --groups wheel ${DOCKER_USER} \
  && echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd \
  && install -d -m 0755 -o ${DOCKER_USER} -g ${DOCKER_USER} /home/${DOCKER_USER}/{ダウンロード,テンプレート,デスクトップ,ドキュメント,ビデオ,音楽,画像,公開}
USER ${DOCKER_USER}
WORKDIR /home/${DOCKER_USER}