pipeline {
    agent any

    environment {
        COMPOSE_FILE = 'docker-compose.yml'
    }

    stages {
        stage('Install Docker Compose') {
            steps {
                script {
                    // Verifica se o docker-compose está instalado, caso contrário instala
                    def dockerComposeInstalled = sh(script: 'command -v docker-compose', returnStatus: true) == 0
                    if (!dockerComposeInstalled) {
                        echo "Docker Compose não encontrado, instalando..."
                        sh '''
                            # Atualiza o repositório e instala o Docker Compose
                            sudo apt-get update
                            sudo apt-get install -y docker-compose
                        '''
                    } else {
                        echo "Docker Compose já está instalado."
                    }
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    sh '''
                        docker-compose down || true   # Evita erro caso o docker-compose não tenha contêineres ativos
                        docker-compose build --no-cache
                        docker-compose up -d
                        docker-compose ps
                    '''
                }
            }
        }

        stage('Wait for Flask') {
            steps {
                script {
                    def isReady = false
                    for (int i = 0; i < 30; i++) { // 30 tentativas (30 segundos)
                        try {
                            // Certifique-se de que a URL do Flask está correta
                            sh 'curl --fail -X GET http://localhost:5000/alunos'
                            isReady = true
                            break
                        } catch (Exception e) {
                            echo "Tentativa ${i + 1} de 30 para verificar se o Flask está pronto..."
                            sleep(1) // Aguarda 1 segundo antes de tentar novamente
                        }
                    }
                    if (!isReady) {
                        error "Servidor Flask não iniciou a tempo!"
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo "Rodando testes com pytest..."

                    // Verifica se os testes estão na pasta correta e executa
                    sh '''
                        pytest app/testAddAluno.py --maxfail=1 --disable-warnings -q
                    '''
                }
            }
        }
    }

    post {
        always {
            // Garante que o docker-compose down seja executado para parar e limpar os contêineres
            sh 'docker-compose down || true'
        }

        success {
            echo 'Pipeline executada com sucesso!'
        }

        failure {
            echo 'Pipeline falhou. Verifique os logs acima.'
        }
    }
}
