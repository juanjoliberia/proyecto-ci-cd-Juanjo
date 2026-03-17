pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'juanjociber'
        APP_NAME = 'proyecto-ci-cd'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                // Usamos comandos de Python que no requieren ser Root
                sh 'pip install --user flask pytest'
                sh 'python3 -m pytest'
            }
        }

        stage('Build Image') {
            steps {
                // Si esto falla por permisos de Docker, al menos el Test ya habrá pasado
                sh "docker build -t ${DOCKERHUB_USER}/${APP_NAME}:latest ."
            }
        }

        stage('Push to DockerHub') {
            steps {
                // Recuerda que esto requiere haber hecho 'docker login' previamente en el servidor
                sh "docker push ${DOCKERHUB_USER}/${APP_NAME}:latest"
            }
        }
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
