# Get latest iventoy version 
# y use google drive -_-, it's to easy to use github so we can automate getting the latest versions and build this container
FROM ziggyds/alpine-utils:latest AS init
ARG IVENTOY
WORKDIR /iventoy
COPY ./iventoy-1.0.17-linux.tar.gz /iventoy/iventoy-1.0.17-linux.tar.gz
RUN tar -xvf *.tar.gz
RUN rm -rf iventoy-1.0.17-linux.tar.gz
RUN mv iventoy-${IVENTOY} iventoy

FROM ubuntu:22.04
WORKDIR /app
# Copy iventoy
COPY --from=init /iventoy/iventoy /app
RUN chmod +x /app/iventoy.sh

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Webui
EXPOSE 26000/tcp
# HTTP server
EXPOSE 16000/tcp
CMD /entrypoint.sh