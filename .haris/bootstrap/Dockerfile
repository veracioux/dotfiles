# Dockerfile for generating ronfig files from the literate dotfiles

FROM alpine

RUN apk add --no-cache emacs
RUN apk add --no-cache git
RUN adduser -D user

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chown user:user /tmp/entrypoint.sh

USER user
WORKDIR /home/user

ENTRYPOINT ["/tmp/entrypoint.sh"]

# vim: filetype=dockerfile
