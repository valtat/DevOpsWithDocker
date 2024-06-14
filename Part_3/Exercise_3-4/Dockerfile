FROM docker:dind

RUN apk add --no-cache \
    git \
    bash \
    curl

ENV DOCKER_USER=""
ENV DOCKER_PWD=""

COPY builder.sh /builder.sh

RUN chmod +x /builder.sh

ENTRYPOINT ["/builder.sh"]

