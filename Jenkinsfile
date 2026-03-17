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
                // Instalación local para evitar errores de permisos
                sh 'pip install --user flask pytest'
                sh 'python3 -m pytest'
            }
        }

        stage('Build') {
            steps {
                echo "Simulando Build para verificar que el pipeline funciona"
                sh "echo 'Construyendo imagen para ${DOCKERHUB_USER}/${APP_NAME}'"
            }
        }

        stage('Push to DockerHub') {
            steps {
                echo "Simulando Push a DockerHub"
                // Descomenta la línea de abajo cuando el servidor tenga Docker configurado
                // sh "docker push ${DOCKERHUB_USER}/${APP_NAME}:latest"
            }
        }

        stage('Deploy') {
            steps {
                echo "Simulando despliegue en Kubernetes"
                // sh 'kubectl apply -f deployment.yaml'
                // sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
