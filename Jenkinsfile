pipeline {
    agent any,
    stages {
        stage('Build') {
            steps {
                sh 'mvn -DskipTests clean package'
                sh 'docker build -t boot-demo:1.0.0 . '
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