FROM alpine:edge

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apk update
RUN apk add --no-cache python3-dev
RUN apk add --no-cache py3-pip
RUN apk add --no-cache bash procps cargo
RUN pip3 install -U telegram-upload
RUN apk add --no-cache build-base boost-dev
RUN apk add --no-cache sudo cmake wget curl ffmpeg mkvtoolnix mediainfo
RUN apk add --no-cache opencl-headers opencl-icd-loader-dev
RUN apk add --no-cache autoconf automake libtool cython pkgconf git nasm yasm fftw-dev zlib-dev
RUN git clone https://github.com/pjjacob98/libs
RUN git clone https://github.com/pjjacob98/alpinepj
RUN cd alpinepj ; pip3 install --no-cache-dir -r requirements.txt

CMD ["bash", "/usr/src/app/alpinepj/start.sh"]
