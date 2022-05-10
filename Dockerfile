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
RUN apk add --no-cache autoconf automake libtool cython pkgconf git nasm yasm fftw-dev zlib-dev meson
RUN git clone https://github.com/sekrit-twc/zimg ; cd zimg ; ./autogen.sh ; ./configure ; make ; make install
RUN git clone https://github.com/vapoursynth/vapoursynth.git ; cd vapoursynth ; ./autogen.sh ; ./configure ; make ; make install
RUN git clone https://github.com/dubhater/vapoursynth-mvtools ; cd vapoursynth-mvtools ; meson build ; cd build ; ninja ; mv ./libmvtools.so "/usr/src/app/vapoursynth/include"
RUN git clone https://github.com/vapoursynth/vs-miscfilters-obsolete ; cd vs-miscfilters-obsolete ; meson build ; cd build ; ninja ; mv ./libmiscfilters.so "/usr/src/app/vapoursynth/include"
RUN git clone https://github.com/sekrit-twc/znedi3 ; cd znedi3 ; git checkout 4090c5c3899be7560380e0420122ac9097ef9e8e ; git submodule init ; git submodule update --recursive ; make x86=1 ; mv ./vsznedi3.so ./nnedi3_weights.bin "/usr/src/app/vapoursynth/include"
RUN git clone https://github.com/vapoursynth/vs-removegrain ; cd vs-removegrain ; meson build ; cd build ; ninja ; mv ./libremovegrain.so "/usr/src/app/vapoursynth/include"
RUN git clone https://github.com/EleonoreMizo/fmtconv ; cd fmtconv/build/unix ; ./autogen.sh ; ./configure ; make ; ./libtool --mode=install /usr/bin/install -c libfmtconv.la "/usr/src/app/vapoursynth/include"
RUN git clone https://github.com/HomeOfVapourSynthEvolution/VapourSynth-EEDI3 ; cd VapourSynth-EEDI3 ; meson build ; cd build ; ninja ; mv ./libeedi3m.so "/usr/src/app/vapoursynth/include"
RUN git clone https://github.com/myrsloik/VapourSynth-FFT3DFilter ; cd VapourSynth-FFT3DFilter ; meson build ; cd build ; ninja ; mv ./libfft3dfilter.so "/usr/src/app/vapoursynth/include"
RUN git clone https://github.com/HomeOfVapourSynthEvolution/VapourSynth-DFTTest ; cd VapourSynth-DFTTest ; meson build ; cd build ; ninja ; mv ./libdfttest.so "/usr/src/app/vapoursynth/include"
RUN git clone https://github.com/Khanattila/KNLMeansCL ; cd KNLMeansCL ; meson build ; cd build ; ninja ; mv ./libknlmeanscl.so "/usr/src/app/vapoursynth/include"
RUN git clone https://github.com/HomeOfVapourSynthEvolution/VapourSynth-AddGrain ; cd VapourSynth-AddGrain ; meson build ; cd build ; ninja ; mv ./libaddgrain.so "/usr/src/app/vapoursynth/include"
RUN wget -O adjust.py "https://www.googleapis.com/drive/v3/files/118lZQzqo6dHKLH_lTiXJMGOb6MJ7cwYi?alt=media&key=AIzaSyB3lrh7-RHcAZIZnc68i5_-sQdvmrDyIrw" ; cp "adjust.py" "/usr/local/lib/python3.10/site-packages"
RUN wget -O havsfunc.py "https://www.googleapis.com/drive/v3/files/115cp64FBg--UP5p-87_1Tc5bQW0VHPc9?alt=media&key=AIzaSyB3lrh7-RHcAZIZnc68i5_-sQdvmrDyIrw" ; cp "havsfunc.py" "/usr/local/lib/python3.10/site-packages"
RUN wget -O mvsfunc.py "https://www.googleapis.com/drive/v3/files/1147iKrs1vKzGfMvblA0L_2wVAIRiPG_l?alt=media&key=AIzaSyB3lrh7-RHcAZIZnc68i5_-sQdvmrDyIrw" ; cp "mvsfunc.py" "/usr/local/lib/python3.10/site-packages"
RUN wget -O nnedi3_resample.py "https://www.googleapis.com/drive/v3/files/10yh4KfWI1NX6rqrLoSm1zRINbzgej4e4?alt=media&key=AIzaSyB3lrh7-RHcAZIZnc68i5_-sQdvmrDyIrw" ; cp "nnedi3_resample.py" "/usr/local/lib/python3.10/site-packages"
RUN wget -O nnedi3aa.py "https://www.googleapis.com/drive/v3/files/1142Q-NKvQF7w840gn6dL9eUmmfpIynh5?alt=media&key=AIzaSyB3lrh7-RHcAZIZnc68i5_-sQdvmrDyIrw" ; cp "nnedi3aa.py" "/usr/local/lib/python3.10/site-packages"
RUN git clone https://github.com/pjjacob98/lib

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
