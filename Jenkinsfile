pipeline {
    agent any

    environment {
        // Biến môi trường nếu cần, ví dụ config DB hoặc mail (cẩn thận bảo mật)
        // DB_URL = 'jdbc:mysql://localhost:3300/laptop_store'
        // DB_USER = 'root'
        // DB_PASS = '123456'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Clean và build jar, chạy test
                sh './mvnw clean package -DskipTests=false'
                // Nếu dùng máy Windows, đổi lệnh trên thành: bat 'mvnw.cmd clean package -DskipTests=false'
            }
        }

        stage('Test') {
            steps {
                sh './mvnw test'
            }
        }

        // Ví dụ deploy hoặc các bước khác
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
