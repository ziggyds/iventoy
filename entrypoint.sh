#!/bin/sh
cd /app
if $AUTO_START_PXE; then
    ./iventoy.sh -R start
else
    ./iventoy.sh start
fi
sleep 5
tail -f log/log.txt