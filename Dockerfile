# Get latest iventoy version 
# y use google drive -_-, it's to easy to use github so we can automate getting the latest versions and build this container
FROM ziggyds/alpine-utils:latest AS init
ARG IVENTOY
WORKDIR /iventoy
COPY ./iventoy-1.0.07-linux.tar.gz /iventoy/iventoy-1.0.07-linux.tar.gz
RUN tar -xvf *.tar.gz
RUN rm -rf iventoy-1.0.07-linux.tar.gz
RUN mv iventoy-${IVENTOY} iventoy

FROM alpine:3.18.2
WORKDIR /app

# Copy and install inventoy
COPY --from=init /iventoy/iventoy /app
RUN chmod +x /app/iventoy

CMD ["/bin/bash", "-c", "bash /iventoy.sh start && sleep infinity"]