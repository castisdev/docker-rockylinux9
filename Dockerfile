# Pull base image
FROM nvidia/cuda:12.9.1-devel-rockylinux9

LABEL org.opencontainers.image.source https://github.com/castisdev/docker-rockylinux9

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# Install EPEL repo
RUN dnf install -y epel-release; dnf -y clean all

# Install
RUN dnf install -y --enablerepo=crb \
  sudo \
  wget \
  gcc \
  gcc-c++ \
  make \
  unzip \
  openssl \
  openssl-devel \
  git \
  subversion \
  tar \
  boost-devel \
  glibc-devel \
  libuuid-devel \
  gdb \
  gdb-gdbserver \
  valgrind \
  mariadb-devel \
  postgresql-server-devel \
  curl-devel \
  xz \
  file \
  vim-enhanced \
  unixODBC-devel \
  mariadb-connector-odbc \
  sysstat \
  psmisc \
  yum-utils \
  tbb-devel \
  gperftools-devel \
  iproute \
  net-tools \
  libunwind-devel \
  libwebp-devel \
  protobuf-compiler \
  patch \
  && dnf -y clean all

ADD install_gcctoolset14.sh /script/
RUN /script/install_gcctoolset14.sh
ENV BUILD_TOOLSET_ENABLE=/opt/rh/gcc-toolset-14/enable

ADD install_cmake3318.sh /script/
RUN /script/install_cmake3318.sh

ADD install_libbacktrace.sh /script/
RUN /script/install_libbacktrace.sh

ADD install_boost187.sh /script/
RUN /script/install_boost187.sh
ENV Boost_DIR /usr/local/boost_1_87_0

ADD install_cryptopp890.sh /script/
RUN /script/install_cryptopp890.sh

ADD install_googletest1170.sh /script/
RUN /script/install_googletest1170.sh

ADD install_python.sh /script/
RUN /script/install_python.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck2180.sh /script/
RUN /script/install_cppcheck2180.sh

ADD install_zsh.sh /script/
RUN /script/install_zsh.sh

ADD install_ninja1131.sh /script/
RUN /script/install_ninja1131.sh

ADD install_srt154.sh /script/
RUN /script/install_srt154.sh

ADD install_ffmpeg703.sh /script/
RUN /script/install_ffmpeg703.sh

ADD install_golang1246.sh /script/
RUN /script/install_golang1246.sh

# Set environment variables
ENV HOME /root
ENV PATH="${PATH}:${HOME}/go/bin:/usr/local/go/bin"

ADD install_wrk420.sh /script/
RUN /script/install_wrk420.sh

# ctail
RUN wget -O - https://raw.githubusercontent.com/castisdev/ctail/master/install.sh --no-check-certificate | bash

# Add root files
ADD ./.bashrc /root/.bashrc

# Define default command
CMD ["scl", "enable", "gcc-toolset-14", "zsh"]
