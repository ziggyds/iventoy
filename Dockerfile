# Download the latest iventoy version
FROM ziggyds/alpine-utils:latest AS init
ARG IVENTOY
WORKDIR /iventoy
RUN echo ${IVENTOY} && \
    wget https://github.com/ventoy/PXE/releases/download/v${IVENTOY}/iventoy-${IVENTOY}-linux-free.tar.gz && \
    tar -xvf *.tar.gz && \
    rm -rf iventoy-${IVENTOY}-linux.tar.gz && \
    mv iventoy-${IVENTOY} iventoy

# Build image
FROM ubuntu:22.04
ENV AUTO_START_PXE=true
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