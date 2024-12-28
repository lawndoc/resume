FROM ubuntu:latest

COPY .deps .

RUN apt-get update
RUN xargs apt-get install -y < .deps

COPY requirements.txt .
RUN pip3 install -r requirements.txt --break-system-packages

WORKDIR /build