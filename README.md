# Kryha's Parity:Stable Image

This is an update to the `parity/parity:stable` image that allows it to run without modifications in docker-compose and Kubernetes environments because the binary is executed as root within the container.

The `--base-path` has been updated to point to `/root/parity` and command line argumensts are supported. This allows easy volume mounting on the host.

Our Docker Hub repository is linked to the `parity/parity:stable` one. As a result, our image gets autobuilt once `parity:stable` is updated.

![Docker Hub Repository Link proof](Repo-link-proof.png){ width=25% }

Docker Hub repository: https://hub.docker.com/r/kryha/parity

Docker-compose example:
```
  parity:
    image: kryha/parity:latest
    volumes:
      - ./parity/:/root/parity/
    command:
      - --chain=tobalaba
      - --jsonrpc-apis=all
      - --jsonrpc-interface=all
      - --jsonrpc-cors=all
      - --ws-port=8546
      - --ws-interface=all
      - --ws-origins=all
      - --ws-hosts=all
```
