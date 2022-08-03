FROM ubuntu:latest

RUN set -eux; \
    apt-get update; \
    apt-get install curl unzip ca-certificates -y --no-install-recommends; \
    rm -rf /var/lib/apt/lists/*

ADD fnm-install.sh /tmp/
RUN /tmp/fnm-install.sh

RUN mkdir /work
WORKDIR /work

# After this you could run: `fnm --log-level quiet use --install-if-missing`
CMD [ "eval", "'$(fnm env --shell bash)'" ]