pipeline {
    agent any

    environment {
        // Hola
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
            apk add --no-cache python3 py3-pip
            python3 -m pip install --upgrade pip
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
