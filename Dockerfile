FROM ubuntu:latest

COPY .deps .

RUN apt-get update
RUN xargs apt-get install -y < .deps
RUN apt-get install -y git