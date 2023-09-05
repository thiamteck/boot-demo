pipeline {
    agent any,
    stages {
        stage('Build') {
            steps {
                sh 'mvn -DskipTests clean package'
                updateGitlabCommitStatus name: 'build', state: 'success'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo deploy'
            }
        }
    }
}