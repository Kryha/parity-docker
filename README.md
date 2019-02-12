# Kryha's Parity Docker Images

The current version of `parity/parity:*` execute the parity binary as the `parity` user, creating issues such as `Error upgrading parity data: CannotCreateConfigPath` when mounting in ContainerOS.

Due to the instability of the Parity CI/CD pipeline for docker images, we built our own which is triggered when Parity pushes an update. Our Docker Hub repository is linked to the `parity/parity:*` one.

<img src="Repo-link-proof.png" width="50%">

It uses exactly the same tags as parity/parity.

This is an update that also allows it to run without modifications in docker-compose on ContainerOS and Kubernetes environments because the binary is executed as root within the container.

Docker Hub repository: https://hub.docker.com/r/kryha/parity

Docker-compose example:
```
  parity:
    image: kryha/parity:beta
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
