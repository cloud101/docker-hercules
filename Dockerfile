FROM ubuntu:latest
# File Author / Maintainer
MAINTAINER Lucas Kauffman
#Install dependencies
RUN apt-get update && apt-get install -y build-essential  \ 
  curl  \ 
 git    \ 
  m4   \ 
  ruby   \ 
  texinfo   \ 
  libbz2-dev   \ 
  libcurl4-openssl-dev   \ 
  libexpat-dev   \ 
  libncurses-dev   \ 
  zlib1g-dev  \
  libtool \ 
  automake \ 
  autoconf \
  libregina3-dev

RUN git clone https://github.com/hercules-390/hyperion.git
WORKDIR hyperion
RUN ls
RUN ./autogen.sh
RUN        ./configure --enable-cckd-bzip2 --enable-regina-rexx
RUN        make
RUN        make install
CMD ["hercules"]
  
EXPOSE 3270

