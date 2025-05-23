pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    if (isUnix()) {
                        sh './mvnw clean package -DskipTests=false'
                    } else {
                        bat 'mvnw.cmd clean package -DskipTests=false'
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    if (isUnix()) {
                        sh './mvnw test'
                    } else {
                        bat 'mvnw.cmd test'
                    }
                }
            }
        }

        /*
        stage('Deploy') {
            steps {
                // deploy script
            }
        }
        */
    }

    post {
        always {
            junit '**/target/surefire-reports/*.xml'
            archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
        }
        success {
            echo 'Build và test thành công!'
        }
        failure {
            echo 'Build hoặc test thất bại!'
        }
    }
}
