pipeline {
    agent any
    
    environment {
        // Define o local do composer;
        COMPOSER = 'docker-compose.yml'
    }

    stages {
                stage('Build') {
            steps {
            sh '''
                docker compose down
                docker compose build
                docker compose up -d
                docker compose ps
            '''
        }
    }
        stage('Checkout') {
            steps {
                // Faz o checkout do código do repositório
                git 'https://your-repository-url.git'
            }
        }
        
        stage('Install Dependencies') {
            steps {
                // Instala as dependências do Composer
                script {
                    sh "${env.COMPOSER} install --no-interaction"
                }
            }
        }
        
        stage('Run Tests') {
            steps {
                // Aqui você pode rodar testes, por exemplo, com PHPUnit
                script {
                    sh 'php vendor/bin/phpunit'
                }
            }
        }

    }
}

