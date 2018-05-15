#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/"

cd "${DIR}" && git pull

echo "Installing Oh-My-Zsh..."
"${DIR}"/setup/files/setup/oh-my-zsh-setup.sh

echo "Installing Homebrew..."
if ! homebrew_bin="$(type -p "brew")" || [ -z "$homebrew_bin" ]; then
    echo "Installing Homebrew"
    /usr/bin/ruby "${DIR}"/files/setup/homebrew-setup.rb
else
    echo "Homebrew already installed... skipping"
fi

if ! ansible_bin="$(type -p "ansible")" || [ -z "$ansible_bin" ]; then
    echo "Installing Ansible..."
    brew install ansible
fi

echo "Installing base packages..."
ansible-playbook "${DIR}"/setup/install-packages.yml

echo "Configuring system..."
ansible-playbook "${DIR}"/setup/configure.yml

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
