FROM ubuntu:12.04
MAINTAINER ethnchao <maicheng.linyi@gmail.com>

RUN apt-get update

RUN apt-get install -y --no-install-recommends \
        tar \
        curl \
        perl \
        make \
        iputils-ping \
        uuid-dev \
        libssl-dev \
        libxml2-dev \
        libarchive-zip-perl \
        libsoap-lite-perl \
        libdata-dump-perl \
        perl-doc \
        libxml-libxml-perl \
        ia32-libs \
    && rm -rf /var/lib/apt/lists/*

RUN curl -o - http://cpanmin.us | perl - --self-upgrade

RUN cd /tmp/ \
    && curl -O http://192.168.120.160/software/vmware/vsphere/VMware%20vSphere%205.5/VMware-vSphere-CLI-5.5.0-2043780.x86_64.tar.gz \
    && tar zxf VMware-vSphere-CLI-5.5.0-2043780.x86_64.tar.gz \
    && yes | ./vmware-vsphere-cli-distrib/vmware-install.pl -d \
    && cpan install GAAS/libwww-perl-5.837.tar.gz \
    && rm -rf /tmp/vmware-vsphere-cli-distrib /tmp/VMware-vSphere-CLI-5.5.0-2043780.x86_64.tar.gz

RUN cd /tmp/ \
    && curl http://192.168.120.160/software/vmware/vsphere/VMware-ovftool-4.1.0-2459827-lin.x86_64.bundle -o ovftool \
    && yes | /bin/bash ovftool --required --console \
    && rm -f ovftool

CMD ["/bin/bash"]