FROM alt:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install python3-module-pip

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
