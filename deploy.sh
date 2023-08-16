#!/bin/bash

read -p "Enter the docker user to deploy to: " USER

PROJECTNAME=clang-build-tools-standalone-dev
CURRENTUSER=$(docker info | sed '/Username:/!d;s/.* //')

if [[ "$CURRENTUSER" != "$USER" ]]; then
    docker login -u $USER
fi

if [[ "$?" -eq 0 ]]; then
    docker build . -t "$USER/$PROJECTNAME"
fi

if [[ "$?" -eq 0 ]]; then
    docker push "$USER/$PROJECTNAME"
fi