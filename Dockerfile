FROM alpine:3.15

RUN set -eux; \
    apk add --no-cache bash; \
    apk add --no-cache --virtual .fetch-deps curl

RUN curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell

RUN apk del --no-network .fetch-deps

ENV PATH=/root/.fnm:$PATH
RUN echo '' >> /root/.bashrc
RUN echo '# fnm' >> /root/.bashrc
RUN echo 'eval "$(fnm env --shell bash)"' >> /root/.bashrc

RUN mkdir /work
WORKDIR /work

ENTRYPOINT [ "bash", "-c", "fnm", "use", "--log-level", "quiet;", "fnm", "--" ]