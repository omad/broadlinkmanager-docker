#FROM python:3
FROM python:3-alpine


ENV PYTHONIOENCODING=utf-8

#RUN apt update && apt install python3-pip libffi-dev libssl-dev --yes
RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev

RUN  pip3 install flask flask_restful cryptography==2.6.1  --no-cache-dir

#Create working directory
RUN mkdir /opt/broadlinkmanager
RUN mkdir /opt/broadlinkmanager/data

EXPOSE 7020

COPY broadlinkmanager /opt/broadlinkmanager

ENTRYPOINT ["/usr/local/bin/python3", "/opt/broadlinkmanager/broadlinkmanager.py"]
