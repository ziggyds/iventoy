
#!/bin/sh
cd /app
./iventoy.sh start 
sleep infinity
tail -f /iventoy/log/log.txt