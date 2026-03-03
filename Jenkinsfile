pipeline {
    agent any

    stages { 
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build'){
            steps {
                echo 'Bezig met bouwen....'
            }
        }
        stage('Test') {
            steps {
                echo 'Tests uitvoeren....'
            }
        }
        stage('Approved') {
            steps {
                echp 'Pipeline approved!'
            }
        }
    }
}