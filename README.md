# iventoy

A Docker image running [iventoy](https://www.iventoy.com).

A github actions workflow runs daily to check if their is a new release.

<https://hub.docker.com/r/ziggyds/iventoy>

## Docker Compose

This does not work with rootless Docker.  The container must be run as root.

If you don't plan on using named volumes, as is used in the example below, you'll have to retrieve the files under /app/data from the container.

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
      - 67:67/udp
      - 69:69/udp
    volumes:
      - isos:/app/iso
      - config:/app/data
      - /<path to logs>:/app/log
    environment:
      - AUTO_START_PXE=true # optional, true by default

volumes:
  isos:
    external: true
  config:
    external: true
```

Not necessary to expose all the listed ports.
<https://www.iventoy.com/en/doc_portnum.html>
