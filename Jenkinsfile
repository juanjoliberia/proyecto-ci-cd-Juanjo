pipeline {
    agent {
        
        docker { 
            image 'python:3.9-slim' 
            args '-u root' 
        }
    }

    environment {
        DOCKERHUB_USER = 'juanjociber'
        APP_NAME = 'proyecto-ci-cd'
    }

    stages {
        stage('Clone') {
            steps {
                checkout scm
            }
        }
        stage('Test') {
            steps {
                sh '''
                    pip install flask pytest
                    pytest
                '''
            }
        }
        stage('Build Image') {
            steps {
                sh "docker build -t ${DOCKERHUB_USER}/${APP_NAME}:latest ."
            }
        }

        stage('DockerHub') {
            steps {
                
                sh "docker push ${DOCKERHUB_USER}/${APP_NAME}:latest"
            }
        }

        stage('Deploy') {
            steps {
             
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
