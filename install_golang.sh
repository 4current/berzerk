#!/bin/bash
set -x
ansible-playbook -vv --ask-become-pass -i ./hosts golang.yml

/usr/local/go/bin/go get -u github.com/ThreeDotsLabs/watermill
