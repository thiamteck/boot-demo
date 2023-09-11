pipeline {
//     agent {
//         docker {
//             image 'maven:3.9.4-eclipse-temurin-17-alpine'
//             args '-v /root/.m2:/root/.m2'
//         }
//     }
    agent any
    stages {
        stage('Build') {
            steps {
                withMaven {
                    sh 'mvn -DskipTests clean package'
                }
            }
        }
        stage('Test') {
            steps {
                sh 'ls -al target'
                withMaven {
                    sh 'mvn test'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo deploy'
                archiveArtifacts artifacts: 'target/*.jar', onlyIfSuccessful: true
            }
        }
    }
}