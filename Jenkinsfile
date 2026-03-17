pipeline {
    agent {
        docker { 
            image 'python:3.9-slim' 
            // Esto le dice a Jenkins que use una imagen que YA tiene todo
        }
    }
    stages {
        stage('Test') {
            steps {
                // Ya no necesitamos apt-get. pip viene instalado en python:3.9-slim
                sh 'pip install flask pytest'
                sh 'pytest'
            }
        }
        stage('Build Image') {
            steps {
                // Aquí el comando docker build funcionará si tu Jenkins tiene acceso al socket de Docker
                sh "docker build -t juanjociber/proyecto-ci-cd:latest ."
            }
        }
        stage('DockerHub') {
            steps {
                sh "docker push juanjociber/proyecto-ci-cd:latest"
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
