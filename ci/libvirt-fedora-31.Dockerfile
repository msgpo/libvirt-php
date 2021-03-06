FROM fedora:31

RUN dnf update -y && \
    dnf install -y \
        autoconf \
        automake \
        bash \
        bash-completion \
        ca-certificates \
        ccache \
        chrony \
        cppi \
        gcc \
        gdb \
        gettext \
        gettext-devel \
        git \
        glibc-devel \
        glibc-langpack-en \
        libtool \
        libvirt-devel \
        libxml2 \
        libxml2-devel \
        libxslt \
        lsof \
        make \
        net-tools \
        ninja-build \
        patch \
        perl \
        perl-App-cpanminus \
        php-devel \
        php-pecl-imagick \
        pkgconfig \
        python3 \
        python3-pip \
        python3-setuptools \
        python3-wheel \
        rpm-build \
        screen \
        strace \
        sudo \
        vim \
        xz && \
    dnf autoremove -y && \
    dnf clean all -y && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/$(basename /usr/bin/gcc)

RUN pip3 install \
         meson==0.54.0

ENV LANG "en_US.UTF-8"

ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja"
ENV PYTHON "/usr/bin/python3"

ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
