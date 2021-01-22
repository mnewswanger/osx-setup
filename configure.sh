#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/"
USER="$(whoami)"

ELASTIC=""

if [ "$1" == "--elastic" ]; then
  ELASTIC=" --extra-vars elastic=yes"
fi

echo "Installing Oh-My-Zsh..."
"${DIR}"/setup/files/setup/oh-my-zsh-setup.sh

echo "Installing Homebrew..."
if ! homebrew_bin="$(type -p "brew")" || [ -z "$homebrew_bin" ]; then
    echo "Installing Homebrew"
    "${DIR}"/setup/files/setup/homebrew-setup.sh
    echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> "/Users/$USER/.zprofile"
    eval $(/opt/homebrew/bin/brew shellenv)
else
    echo "Homebrew already installed... skipping"
fi

if ! ansible_bin="$(type -p "ansible")" || [ -z "$ansible_bin" ]; then
    echo "Installing Ansible..."
    brew install ansible
fi

echo "Installing base packages..."
ansible-playbook "${DIR}"/setup/install-packages.yml ${ELASTIC}

echo "Configuring system..."
ansible-playbook "${DIR}"/setup/configure.yml ${ELASTIC}

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
