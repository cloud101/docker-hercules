FROM ubuntu:latest
# File Author / Maintainer
MAINTAINER Lucas Kauffman
#Install dependencies
RUN apt-get update && apt-get install -y build-essential  \ 
  curl  \ 
  git    \ 
  libtool \ 
  automake \ 
  autoconf \
 libbz2-dev   \ 
  libcurl4-openssl-dev   \ 
  libexpat-dev   \ 
  zlib1g-dev  \
  libregina3-dev

RUN git clone https://github.com/hercules-390/hyperion.git
WORKDIR hyperion
RUN ./autogen.sh
RUN        ./configure --enable-cckd-bzip2 --enable-regina-rexx
RUN        make
RUN        make install
CMD ["hercules"]
  
EXPOSE 3270

