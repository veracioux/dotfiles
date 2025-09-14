# Dockerfile for generating config files from the literate dotfiles

FROM alpine:3.22

RUN apk add --no-cache emacs emacs-nox
RUN adduser -D user

COPY bootstrap/entrypoint.sh /tmp/entrypoint.sh
RUN chown user:user /tmp/entrypoint.sh

WORKDIR /home/user
COPY . .haris
RUN chown -R user .
USER user

ENTRYPOINT ["/tmp/entrypoint.sh"]
