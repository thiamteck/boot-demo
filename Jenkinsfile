pipeline {
    agent {
        docker {
            image 'maven:3.9.4-eclipse-temurin-17-alpine'
            args '-v /root/.m2:/root/.m2'
        }
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
                sh 'echo deploy'
                archiveArtifacts artifacts: '../target/*.jar', onlyIfSuccessful: true
            }
        }
    }
}