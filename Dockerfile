# Get latest iventoy version 
# y use google drive -_-, it's to easy to use github so we can automate getting the latest versions and build this container
FROM ziggyds/alpine-utils:latest AS init
WORKDIR /iventoy
COPY ./iventoy-1.0.07-linux.tar.gz /iventoy/iventoy-1.0.07-linux.tar.gz
RUN tar -xvf *.tar.gz

FROM alpine:3.18.2
WORKDIR /

# Copy and install inventoy
COPY --from=init /iventoy /
RUN chmod +x /app/lib/iventoy

CMD ["/bin/bash", "-c", "bash /iventoy.sh start && sleep infinity"]