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

            apt-get update && apt-get install -y python3 python3-pip
            
        
            pip3 install --break-system-packages flask pytest
            
          
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
