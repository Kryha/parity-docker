FROM parity/parity:stable

LABEL maintainer="dan@kryha.io"

USER root
WORKDIR /root/parity
ENTRYPOINT ["/home/parity/bin/parity", "--base-path", "/root/parity"] 

VOLUME [ "/root/parity" ]
