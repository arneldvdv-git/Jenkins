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

        stage('Run New Container') {
            steps {
                sh """
                docker run --rm \
                  --name ${CONTAINER_NAME} \
                  -p 8081:80 \
                  ${IMAGE_NAME}:latest
                """
            }
        }

         stage('Push') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com/repository/docker/arneldvdv/test') {
                        dockerImage.push()
                    }
                }
            }
         }
    }
}