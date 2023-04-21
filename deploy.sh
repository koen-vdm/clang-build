#!/bin/bash

docker build . -t koenvdm/clang-build-tools

if [[ "$?" -eq 0 ]]; then
    docker push koenvdm/clang-build-tools
fi