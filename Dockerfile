FROM rockylinux:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN echo "defaultyes=True" >> /etc/dnf/dnf.conf
RUN dnf update
RUN dnf install python39-pip
RUN dnf install procps-ng

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
