#!/bin/bash
set -x
ansible-playbook -i ./hosts kafka.yml
