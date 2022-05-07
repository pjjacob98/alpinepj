FROM amazonlinux:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN yum update -y
RUN yum install python3-pip -y

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
