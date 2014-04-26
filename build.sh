#!/bin/bash

DOCKERNAME="ansibleshipyard/nodejs"

time docker build -t $DOCKERNAME .

echo "to use this docker:"
echo "    docker run -d -P $DOCKERNAME"
echo
echo " then, with the port listed running [docker ps]"
echo "    curl http://localhost:<port>"
echo " should yield an html page response"
echo
echo "to run in interactive mode for debug:"
echo "    docker run -t -i $DOCKERNAME bash"
echo
