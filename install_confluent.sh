#!/bin/bash
set -x
[ -z "$SUDO_USER" ] && echo "This must be run with sudo" && exit 1
ansible-galaxy install geerlingguy.docker
ansible-galaxy install geerlingguy.pip
cat >hosts <<HERE
[local]
localhost
HERE

cat >docker.yml <<THERE
- hosts: local
  connection: local
  vars:
    pip_install_packages:
      - name: docker
    ansible_distribution: ubuntu
    ansible_distribution_release: bionic
    docker_users:
      - "$SUDO_USER"
  roles:
    - geerlingguy.pip
    - geerlingguy.docker
THERE

sudo ansible-playbook -i ./hosts docker.yml
