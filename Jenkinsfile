pipeline {
    agent { label 'remote' }
    parameters {
        string(name: 'HOST_IP', defaultValue: '', description: 'IP address of the remote host')
        string(name: 'USERNAME', defaultValue: '', description: 'Username to create or use')
        password(name: 'PASSWORD', defaultValue: '', description: 'Password for the user')
        string(name: 'SSH_KEY', defaultValue: '', description: 'SSH key for remote connection')
        text(name: 'PACKAGES', defaultValue: '', description: 'List of packages to install')
        text(name: 'CONFIG_FILES', defaultValue: '', description: 'Configuration files for the software')
    }
    stages {
        stage('Print') {
            steps {
                script {
                    // Checkout the repository
                    echo "${params.HOST_IP}"
                    checkout scm
                    // Run Ansible playbook
                    ansiblePlaybook(
                        playbook: 'playbooks/setup_remote_host.yml',
                        //inventory: 'inventory/hosts.ini',
                        extras: "-e host_ip=${params.HOST_IP} -e username=${params.USERNAME} -e password=${params.PASSWORD} -e ssh_key=${params.SSH_KEY} -e packages='${params.PACKAGES}' -e config_files='${params.CONFIG_FILES}'"
                    )
                }
            }
        }
    }
}
