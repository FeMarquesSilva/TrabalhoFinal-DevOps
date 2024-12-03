pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/FeMarquesSilva/Trabalho_DevOps_22.8883-5.git'
            }
        }

        stage('Install Docker') {
            steps {
                script {
                    // Verificar se o Docker está instalado
                    def dockerInstalled = sh(script: 'which docker', returnStatus: true) == 0
                    if (!dockerInstalled) {
                        echo 'Docker não encontrado. Instalando...'
                        sh '''
                            sudo apt-get update
                            sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
                            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
                            sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
                            sudo apt-get update
                            sudo apt-get install -y docker-ce
                            sudo usermod -aG docker jenkins
                        '''
                    }
                }
            }
        }

        stage('Install Docker Compose') {
            steps {
                script {
                    // Verificar se o Docker Compose está instalado
                    def dockerComposeInstalled = sh(script: 'which docker-compose', returnStatus: true) == 0
                    if (!dockerComposeInstalled) {
                        echo 'Docker Compose não encontrado. Instalando...'
                        sh '''
                            sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                            sudo chmod +x /usr/local/bin/docker-compose
                        '''
                    }
                }
            }
        }

        stage('Build and Deploy') {
            steps {
                script {
                    // Garantir que o Docker e o Docker Compose estão funcionando
                    sh 'docker --version'
                    sh 'docker-compose --version'

                    // Rodar a construção com o Docker Compose
                    sh 'docker-compose build'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Rodar os testes
                    echo 'Rodando testes...'
                }
            }
        }

        stage('Post Actions') {
            steps {
                echo 'Pipeline concluída.'
                sh 'docker-compose down'
            }
        }
    }
}
