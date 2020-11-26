#FROM python:3
FROM python:3-alpine


ENV PYTHONIOENCODING=utf-8

RUN apk add gcc musl-dev python3-dev fping libffi-dev openssl-dev

RUN  pip3 install flask flask_restful loguru cryptography==2.6.1  --no-cache-dir

#RUN apt install python3-pip libffi-dev fping libssl-dev --yes

#Create working directory
RUN mkdir /opt/broadlinkmanager
RUN mkdir /opt/broadlinkmanager/data

EXPOSE 7020

COPY broadlinkmanager /opt/broadlinkmanager

ENTRYPOINT ["/usr/local/bin/python3", "/opt/broadlinkmanager/broadlinkmanager.py"]
