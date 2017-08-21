#!/bin/bash

echo "Installing Oh-My-Zsh..."
./files/setup/oh-my-zsh-setup.sh

echo "Installing Homebrew..."
if ! homebrew_bin="$(type -p "brew")" || [ -z "$homebrew_bin" ]; then
    echo "Installing Homebrew"
    /usr/bin/ruby ./files/setup/homebrew-setup.rb
else
    echo "Homebrew already installed... skipping"
fi

echo "Installing Ansible..."
brew install ansible

echo "Installing base packages..."
ansible-playbook install-packages.yml

echo "Configuring system..."
ansible-playbook configure.yml

if [ -z $GOPATH ]
then
    GOPATH=~/go
fi

if ! delve_bin="$(type -p "dlv")" || [ -z "$delve_bin" ]; then
    echo "Installing Delve"
    xcode-select --install
    go get github.com/derekparker/delve/cmd/dlv
    cd $GOPATH/src/github.com/derekparker/delve && make install
else
    echo "Delve already installed... skipping"
fi
