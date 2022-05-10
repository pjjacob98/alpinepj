FROM alpine:edge

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apk update
RUN apk add --no-cache python3-dev
RUN apk add --no-cache py3-pip

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
