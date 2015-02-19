#!/bin/bash

DOCKERNAME="ansibleshipyard/ansible-nodejs"

usage() {
  echo
  echo "To pull it"
  echo "    docker pull $DOCKERNAME"
  echo
  echo "To use this docker:"
  echo "    docker run -d -P $DOCKERNAME"
  echo
  echo "To run in interactive mode for debug:"
  echo "    docker run -t -i $DOCKERNAME bash"
  echo
}

# Builds the image
cmd=time docker build --force-rm -t $DOCKERNAME .
echo "$cmd"
run=$($cmd)

if [ $? == 0 ]; then
  usage
else
  echo "Build failed!"
  exit 1
fi;
