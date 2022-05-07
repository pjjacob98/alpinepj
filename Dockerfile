FROM archlinux:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN pacman -Syu --noconfirm
RUN pacman -Syu python-pip --noconfirm
RUN pacman -Syu procps-ng --noconfirm

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
