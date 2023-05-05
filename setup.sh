#!/bin/bash

echo "setup script; keep credentials at hand"
aws configure
aws s3 cp s3://dlglpcgithubci/sdk/SDK6.1182.1.zip .
unzip SDK6*
cd $(find . -name "projects")
git clone https://github.com/dialog-semiconductor/BLE_SDK6_examples.git -b ci-clang

read -p "Do you want to setup ssh key? [Y/n] " ynAnswer
if [[ "$ynAnswer" == "" ] || [ "$ynAnswer" == "y" ] || [ "$ynAnswer" == "Y" ]]; then
    read -p "Enter passphrase (empty for no passphrase) " passphrase
    ssh-keygen -t ecdsa -f ~/.ssh/id_ecdsa -q -N "$passphrase"
    echo "Add this key to bitbucket if you intend to clone projects from there:"
    echo $(cat ~/.ssh/id_ecdsa.pub)
    echo "add the key here: https://bitbucket.diasemi.com/plugins/servlet/ssh/account/keys"
fi