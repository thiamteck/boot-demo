pipeline {
//     agent {
//         docker {
//             image 'maven:3.9.4-eclipse-temurin-17-alpine'
//             args '-v /root/.m2:/root/.m2'
//         }
//     }

//     agent any

    agent { label 'ansible' }

//     tools {
//             maven 'Maven 3.5.x'
//     }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -DskipTests clean package'
//                 withMaven {
//                     sh 'mvn -DskipTests clean package'
//                 }
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
//                 withMaven {
//                     sh 'mvn test'
//                 }
            }
        }
        stage('Deploy') {
            steps {
                timeout(time: 15, unit: "MINUTES") {
                    input message: 'Do you want to approve the deployment?', ok: 'Yes'
                }

                sh 'echo deploy'
                archiveArtifacts artifacts: 'target/*.jar', onlyIfSuccessful: true
                sh 'ansible-playbook ansible-hello-world.yml'
            }
        }
    }
}