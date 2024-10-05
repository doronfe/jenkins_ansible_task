
FROM ubuntu:20.04

#Install Ansible and dependencies
RUN apt-get update && apt-get install -y sudo ansible sshpass openssh-server && apt-get clean 

RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd

# SSH login fix. Otherwise, user is kicked off after login
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

#Copy the Ansible roles and playbook
COPY roles /etc/ansible/roles 
COPY playbook.yml /etc/ansible/playbook.yml 
COPY inventory.ini /etc/ansible/inventory 
COPY run_playbook.sh /usr/local/bin/run_playbook.sh
COPY id_ed25519 ~/.ssh/id_ed25519
COPY id_ed25519 ~/.ssh/id_ed25519.pub

#Make the script executable
RUN chmod 777 /usr/local/bin/run_playbook.sh
