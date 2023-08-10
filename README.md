# iventoy

A docker image running iventoy. 

A github actions workflow runs daily to check if their is a new release.

https://hub.docker.com/r/ziggyds/iventoy

## Docker Compose
````
---
version: '3.9'
services:
  iventoy:
   volumes:
     - <mount>:<folder>
    ports:
      - 26000:26000 
      - 16000:16000 
      - 10809:10809
      - 67:67
      - 69:69
    image: ziggyds/iventoy:latest
    restart: unless-stopped
````
Not necessary to expose all the listed ports.
https://www.iventoy.com/en/doc_portnum.html