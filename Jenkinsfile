pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps { checkout scm }
        }
        stage('Deploy & Run') {
            steps {
                script {
                    echo "Iniciando servidor Python..."
                    // Intentamos lanzar el servidor en segundo plano
                    sh 'nohup python3 app.py > output.log 2>&1 &'
                }
            }
        }
    }
}
}
