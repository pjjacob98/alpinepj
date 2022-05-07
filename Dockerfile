FROM archlinux:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN pacman -Syu
RUN echo "[extra]" >> /etc/pacman.conf
RUN echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
RUN pacman -Syu
RUN pacman -Syu python-pip

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
