FROM archlinux:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN pacman -S python-pip

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
