pipeline {
    agent any

    environment {
        IMAGE_NAME = "hello-world"
        CONTAINER_NAME = "myapp"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                script {
                    sh """
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                    """
                }
            }
        }

        stage('Run New Container') {
            steps {
                sh """
                docker run -d \
                  --name ${CONTAINER_NAME} \
                  -p 8081:80 \
                  ${IMAGE_NAME}:latest
                """
            }
        }
    }
}