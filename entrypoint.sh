
#!/bin/sh
cd /app
./iventoy.sh start 
sleep 5
tail -f log/log.txt