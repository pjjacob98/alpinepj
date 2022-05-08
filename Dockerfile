FROM alpine:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apk update
RUN apk add --no-cache python3-dev
RUN apk add --no-cache py3-pip
RUN apk add --no-cache bash procps
RUN apk add --no-cache build-base boost-dev
RUN apk add --no-cache sudo cmake wget curl ffmpeg mkvtoolnix mediainfo
RUN apk add --no-cache opencl-headers opencl-icd-loader-dev
RUN apk add --no-cache autoconf automake libtool cython pkgconf git nasm yasm fftw-dev zlib-dev meson
RUN apk add gcc musl-dev python3-dev py3-setuptools libffi libffi-dev openssl-dev
RUN pip3 install poetry
RUN pip3 install --no-build-isolation cryptg

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
