# ansible_k3s

Read install.md to install docker

This release includes the below:
ansible.cfg
docker-compose.yml
Dockerfile
Dockerfile.agent
id_ed25519
id_ed25519.pub
Install.md
inventory.ini
playbook.yml
README.md
roles
  install
  k3s_install
run_playbook.sh
task.md

./roles:


./roles/install:
tasks

./roles/install/tasks:
main.yml

./roles/k3s_install:

files
tasks

./roles/k3s_install/files:
k3s
k3s-killall.sh
k3s-uninstall.sh

./roles/k3s_install/tasks:
main.yml



Run:
docker compose up -d

