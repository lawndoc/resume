FROM ubuntu:latest

COPY .deps .

RUN apt-get update
RUN xargs apt-get install -y < .deps

WORKDIR /build