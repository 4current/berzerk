#!/bin/bash
set -x
ansible-playbook -vv -i ./hosts kafka.yml
