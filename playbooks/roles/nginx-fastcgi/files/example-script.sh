#!/bin/bash
DATA=`date`
echo "content-type: text/plain"
echo
echo  "The date is: $DATA"
# the variable REMOTE_USER indicates a user authenticated by nginx (if present)
echo  "Authenticated User: $REMOTE_USER"

service code-server@$REMOTE_USER status | grep 'active (running)' > /dev/null 2>&1

if [ $? != 0 ]
then
        sudo systemctl start code-server@$REMOTE_USER > /dev/null
        echo "Starting code-server" 
fi