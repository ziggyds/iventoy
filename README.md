# iventoy

A Docker image running [iventoy](https://www.iventoy.com).

A github actions workflow runs daily to check if their is a new release.

<https://hub.docker.com/r/ziggyds/iventoy>

## Docker Compose

This does not work with rootless Docker.  The container must be run as root.

```yaml
---
version: '3.9'
services:
  iventoy:
    image: ziggyds/iventoy:latest
    container_name: iventoy
    restart: always
    privileged: true #must be true
    ports:
      - 26000:26000
      - 16000:16000
      - 10809:10809
      - 67:67
      - 69:69
    volumes:
      - /<path to isos>:/iventoy/iso
      - /<path to config>:/iventoy/data
      - /<path to logs>:/iventoy/log
    environment:
      - AUTO_START_PXE=true # optional, true by default
```

Not necessary to expose all the listed ports.
<https://www.iventoy.com/en/doc_portnum.html>
