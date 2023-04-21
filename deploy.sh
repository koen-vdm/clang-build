#!/bin/bash

read -p "Enter the docker user to deploy to: " user

docker build . -t "$user/clang-build-tools"

if [[ "$?" -eq 0 ]]; then
    docker push "$user/clang-build-tools"
fi