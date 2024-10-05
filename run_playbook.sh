#!/bin/bash
sudo /usr/sbin/sshd -D &
ansible-playbook -i /etc/ansible/inventory.ini /etc/ansible/playbook.yml
sleep infinity