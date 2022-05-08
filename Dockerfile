FROM alpine:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apk update
RUN apk add --no-cache python3-dev
RUN apk add --no-cache py3-pip
RUN apk add --no-cache bash
RUN apk add --no-cache procps
RUN apk add --no-cache build-base
RUN apk add --no-cache sudo wget curl ffmpeg mkvtoolnix mediainfo
RUN apk add --no-cache cmake
RUN apk add --no-cache opencl-headers opencl-icd-loader-dev
RUN apk add --no-cache autoconf automake libtool cython pkgconf
RUN apk add --no-cache git nasm yasm zlib
RUN apk add --no-cache fftw-dev zlib-dev
RUN apk add --no-cache meson
RUN git clone https://github.com/sekrit-twc/zimg ; cd zimg ; ./autogen.sh ; ./configure ; make ; make install
RUN git clone https://github.com/vapoursynth/vapoursynth.git ; cd vapoursynth ; ./autogen.sh ; ./configure ; make ; make install

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
