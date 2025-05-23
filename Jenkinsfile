pipeline {
    agent any

    environment {
        MAVEN_OPTS = "-Dmaven.test.failure.ignore=true"
    }

    stages {
        stage('Checkout') {
            steps {
          
                checkout scm
            }
        }

        stage('Build') {
            steps {
                dir('LapTopStore') {
                    script {
                        if (isUnix()) {
                            sh './mvnw clean package -DskipTests=false'
                        } else {
                            bat 'mvnw.cmd clean package -DskipTests=false'
                        }
                    }
                }
            }
        }

        stage('Test') {
            steps {
                dir('LapTopStore') {
                    script {
                        if (isUnix()) {
                            sh './mvnw test'
                        } else {
                            bat 'mvnw.cmd test'
                        }
                    }
                }
            }
        }

        stage('Archive Artifacts') {
            steps {
                dir('LapTopStore') {
                    archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
