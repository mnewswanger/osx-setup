#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/"

ansible-playbook "${DIR}"/setup/personal-git-repo-setup.yml
