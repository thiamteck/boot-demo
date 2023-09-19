pipeline {
    agent { label 'ansible' }

    environment {
        REMOTE_SERVER_CREDENTIALS = credentials('deploy_credential')
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                timeout(time: 15, unit: "MINUTES") {
                    input message: 'Do you want to approve the deployment?', ok: 'Yes'
                }

                sh 'echo deploy'
                // archiveArtifacts artifacts: 'target/*.jar', onlyIfSuccessful: true
                // sh 'ansible-playbook ansible-hello-world.yml'
                sh 'ansible-playbook -vvvv -i inventory.yml -c paramiko ansible_deploy.yml -e "ansible_ssh_user=${REMOTE_SERVER_CREDENTIALS_USR} ansible_ssh_pass=${REMOTE_SERVER_CREDENTIALS_PSW}"'
            }
        }
    }
}