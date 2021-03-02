#!/bin/bash
# Get environment variables to show up in SSH session
eval $(printenv | sed -n "s/^\([^=]\+\)=\(.*\)$/export \1=\2/p" | sed 's/"/\\\"/g' | sed '/=/s//="/' | sed 's/$/"/' >> /etc/profile)

set -e
service ssh start
echo "Starting SSH ..."
java -jar /opt/app/app.jar
#systemctl start ssh