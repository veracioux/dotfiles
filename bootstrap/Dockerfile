# Dockerfile for generating config files from the literate dotfiles

FROM alpine

RUN apk add --no-cache emacs
RUN adduser -D user

COPY bootstrap/entrypoint.sh /tmp/entrypoint.sh
RUN chown user:user /tmp/entrypoint.sh

WORKDIR /home/user
COPY . .haris
RUN chown -R user .
USER user

ENTRYPOINT ["/tmp/entrypoint.sh"]

# vim: filetype=dockerfile
