FROM debian:testing
MAINTAINER joseph@cauldrondevelopment.com

# Install prerequisites
RUN apt-get update && \
  apt-get install -y --no-install-recommends git less vim debian-keyring \
    debian-archive-keyring ca-certificates apt-utils

RUN apt-get update && \
  apt-get install -y build-essential libtool libltdl3-dev libgc-dev \
  libcurl3-dev libxml2-dev m4 automake libtool-bin

# Environment
ENV INSTALL_PATH=/usr/local/xmlpl
ENV PATH=$INSTALL_PATH/bin:$PATH

# Build libantlr
RUN git clone --depth=1 https://github.com/xmlpl/libantlr.git &&\
  cd libantlr &&\
  ./autogen.sh &&\
  ./configure --prefix=$INSTALL_PATH &&\
  make -j$(grep -c ^processor /proc/cpuinfo) &&\
  make install

# Build libbasicutils
RUN git clone --depth=1 https://github.com/xmlpl/libbasicutils.git &&\
  cd libbasicutils &&\
  ./autogen.sh &&\
  ./configure --prefix=$INSTALL_PATH &&\
  make -j$(grep -c ^processor /proc/cpuinfo) &&\
  make install

# Build libxmlpl-cpp-runtime
RUN git clone --depth=1 https://github.com/xmlpl/libxmlpl-cpp-runtime.git &&\
  cd libxmlpl-cpp-runtime &&\
  ./autogen.sh &&\
  ./configure --prefix=$INSTALL_PATH &&\
  make -j$(grep -c ^processor /proc/cpuinfo) &&\
  make install

# Build xmlplcc
RUN git clone --depth=1 https://github.com/xmlpl/xmlplcc.git &&\
  cd xmlplcc &&\
  ./autogen.sh &&\
  ./configure --prefix=$INSTALL_PATH &&\
  make -j$(grep -c ^processor /proc/cpuinfo) &&\
  make install

# Build libxmlpl-cpp-standard
RUN git clone --depth=1 https://github.com/xmlpl/libxmlpl-cpp-standard.git &&\
  cd libxmlpl-cpp-standard &&\
  ./autogen.sh &&\
  ./configure --prefix=$INSTALL_PATH &&\
  make -j$(grep -c ^processor /proc/cpuinfo) &&\
  make install

# Build xmlpl
RUN git clone --depth=1 https://github.com/xmlpl/xmlpl.git &&\
  cd xmlpl &&\
  ./autogen.sh &&\
  ./configure --prefix=$INSTALL_PATH &&\
  make -j$(grep -c ^processor /proc/cpuinfo) &&\
  make install


ENTRYPOINT [\
  "/bin/bash", "-c", "mkdir /host/xmlpl; cp -av $INSTALL_PATH /host/xmlpl"]

# Build like this:
#
#    docker build --rm -t xmlpl .
#
# Then run with mount point to extract package
#
#    docker run --rm -itv $PWD:/host xmlpl
#
# Or run a shell like this
#
#    docker run --rm -itv $PWD:/host --entrypoint=/bin/bash xmlpl
