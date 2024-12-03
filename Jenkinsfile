pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/FeMarquesSilva/Trabalho_DevOps_22.8883-5.git'
        BRANCH = 'main'  // Certifique-se de que é o ramo correto
    }

    stages {
        stage('Declarative: Checkout SCM') {
            steps {
                script {
                    checkout scm: [
                        $class: 'GitSCM',
                        branches: [[name: "*/${env.BRANCH}"]],
                        userRemoteConfigs: [[url: env.GIT_REPO]]
                    ]
                }
            }
        }
        
        stage('Install Docker') {
            steps {
                script {
                    sh '''
                    apt-get update -y
                    apt-get install -y docker.io
                    '''
                }
            }
        }

        stage('Install Docker Compose') {
            steps {
                script {
                    sh '''
                    apt-get install -y python3-pip
                    pip3 install docker-compose
                    '''
                }
            }
        }

        stage('Build and Deploy') {
            steps {
                script {
                    sh 'docker-compose build'
                    sh 'docker-compose up -d'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    sh 'docker-compose exec app pytest tests/'
                }
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline finished.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
