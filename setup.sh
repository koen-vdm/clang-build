#!/bin/bash

print("setup script; keep credentials at hand")
aws configure
aws s3 cp s3://dlglpcgithubci/sdk/SDK6.1182.1.zip .
unzip SDK6* -d ./SDK
cd SDK/projects
git clone https://github.com/dialog-semiconductor/BLE_SDK6_examples.git -b ci-clang