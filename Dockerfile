FROM debian:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y python3-pip

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
