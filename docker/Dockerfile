FROM debian:testing
MAINTAINER joseph@cauldrondevelopment.com

# Install prerequisites
RUN apt-get update && \
  apt-get install -y --no-install-recommends git less vim debian-keyring \
    debian-archive-keyring ca-certificates apt-utils

RUN apt-get update && \
  apt-get install -y build-essential libtool libltdl3-dev libgc-dev \
  libcurl3-dev libxml2-dev

# Get source code
RUN git clone --depth=1 https://github.com/xmlpl/libantlr.git
RUN git clone --depth=1 https://github.com/xmlpl/libbasicutils.git
RUN git clone --depth=1 https://github.com/xmlpl/libxmlpl-cpp-standard.git
RUN git clone --depth=1 https://github.com/xmlpl/libxmlpl-cpp-runtime.git
RUN git clone --depth=1 https://github.com/xmlpl/xmlplcc.git
RUN git clone --depth=1 https://github.com/xmlpl/xmlpl.git

RUN apt-get update && \
  apt-get install -y m4 automake

# Build libantlr
RUN cd libantlr &&\
  ./autogen.sh &&\
  ./configure --prefix=/install &&\
  make -j$(grep -c ^processor /proc/cpuinfo) &&\
  make install

# Build libbasicutils
RUN cd libbasicutils &&\
  ./autogen.sh &&\
  ./configure --prefix=/install &&\
  make -j$(grep -c ^processor /proc/cpuinfo) &&\
  make install

# Build libxmlpl-cpp-runtime
RUN cd libxmlpl-cpp-runtime &&\
  ./autogen.sh &&\
  ./configure --prefix=/install &&\
  make -j$(grep -c ^processor /proc/cpuinfo) &&\
  make install

# Build xmlplcc
RUN cd xmlplcc &&\
  ./autogen.sh &&\
  ./configure --prefix=/install &&\
  make -j$(grep -c ^processor /proc/cpuinfo) &&\
  make install

# Build libxmlpl-cpp-standard
RUN cd libxmlpl-cpp-standard &&\
  ./autogen.sh &&\
  ./configure --prefix=/install &&\
  make -j$(grep -c ^processor /proc/cpuinfo) &&\
  make install

# Build xmlpl
RUN cd xmlpl &&\
  ./autogen.sh &&\
  ./configure --prefix=/install &&\
  make -j$(grep -c ^processor /proc/cpuinfo) &&\
  make install


ENTRYPOINT ["/bin/bash", "-c", "mkdir /host/xmlpl; cp -av /install /host/xmlpl"]

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
