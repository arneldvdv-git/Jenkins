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
                docker run -d --rm \
                  --name ${CONTAINER_NAME} \
                  -p 8081:80 \
                  ${IMAGE_NAME}:latest
                """
            }
        }

        stage('Push to docker registry') {
            steps {
                    docker.withRegistry('https://hub.docker.com/repository/docker/arneldvdv/test', 'f190aaa0-d97d-4534-be17-5f806f4b6930') {
                        dockerImage.push()
                    }
                }
            }
         }
    }