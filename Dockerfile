FROM alpine:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apk update
RUN apk upgrade
RUN apk add --upgrade mkvtoolnix
RUN git clone https://github.com/pjjacob98/lib

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
