# iventoy

A docker image running iventoy. 

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
    image: ziggyds/iventoy:latest
    restart: unless-stopped
````
