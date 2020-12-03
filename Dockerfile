FROM centos:8
LABEL MAINTAINER="Frederic Leger <frederic@webofmars.com>"

# RUN yum -y install yum-plugin-priorities && yum -q makecache
# COPY yum-varnish4-community.repo /etc/yum.repos.d/varnish.repo
RUN yum -q makecache && \
    yum install -y epel-release
RUN yum install -y rpm-build jemalloc-devel libedit ncurses-devel \
                   pcre-devel platform-python-devel platform-python-pip python3-docutils wget git automake autoconf libtool \
                   mock make logrotate initscripts systemd-sysv libcurl-devel vim geoip-devel \
                   mhash-devel libmaxminddb-devel varnish varnish-devel
RUN pip3 install sphinx

WORKDIR /root

RUN yumdownloader --source varnish
RUN rpm -Uvh varnish-*.src.rpm

VOLUME /target /root/rpmbuild/SPECS /root/rpmbuild/SOURCES

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
