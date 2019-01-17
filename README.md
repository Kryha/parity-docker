# Kryha's Parity:Nightly Image

The current version of `parity/parity:nightly` executes the parity binary as the `parity` user, creating issues such as `Error upgrading parity data: CannotCreateConfigPath` when mounting in ContainerOS.

This is an update that allows it to run without modifications in docker-compose on ContainerOS and Kubernetes environments because the binary is executed as root within the container.

The `--base-path` has been updated to point to `/root/parity` and command line argumensts are supported. This allows easy volume mounting on the host.

Our Docker Hub repository is linked to the `parity/parity:nightly` one. As a result, our image gets autobuilt once `parity:nightly` is updated.

<img src="Repo-link-proof.png" width="50%">

Docker Hub repository: https://hub.docker.com/r/kryha/parity

Docker-compose example:
```
  parity:
    image: kryha/parity:latest
    volumes:
      - .parity/:/root/parity/
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

Example live deployment: https://ewf.kryha.io
