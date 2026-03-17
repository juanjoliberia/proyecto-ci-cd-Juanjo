pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'juanjociber'
        APP_NAME = 'proyecto-ci-cd-juanjo'
    }

    stages {
        stage('Checkout') {
            steps {
                // Esto ya sabemos que funciona perfectamente
                checkout scm
            }
        }

        stage('Test') {
            steps {
                echo "Simulando ejecución de Tests..."
                echo "Flask y Pytest validados correctamente (Simulado)"
            }
        }

        stage('Build Image') {
            steps {
                echo "Simulando Build de Docker..."
                echo "Imagen ${DOCKERHUB_USER}/${APP_NAME}:latest creada con éxito"
            }
        }

        stage('Push to DockerHub') {
            steps {
                echo "Simulando Push a DockerHub..."
                echo "Imagen subida correctamente a la cuenta de ${DOCKERHUB_USER}"
            }
        }

        stage('Deploy') {
            steps {
                echo "Simulando despliegue en Kubernetes..."
                echo "Aplicación desplegada en el clúster correctamente"
            }
        }
    }
}
