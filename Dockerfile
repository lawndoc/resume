FROM ubuntu:latest

COPY .deps .

RUN apt-get update
RUN xargs apt-get install -y < .deps

WORKDIR /build
RUN git config --global user.name "GitHub Actions [bot]" && \
    git config --global user.email "41898282+github-actions[bot]@users.noreply.github.com" && \
    git config --global --add safe.directory '*'