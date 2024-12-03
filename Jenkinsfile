pipeline {
    agent any

    environment {
        COMPOSE_FILE = 'docker-compose.yml'
    }

    stages {
        stage('Build') {
            steps {
                sh '''
                    docker compose down
                    docker compose build --no-cache
                    docker compose up -d
                    docker compose ps
                '''
            }
        }

        stage('Wait for Flask') {
            steps {
                script {
                    def isReady = false
                    for (int i = 0; i < 30; i++) { // 30 tentativas (30 segundos)
                        try {
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
        sh '''
            echo "Rodando testes com pytest..."


            # Rodando os testes com pytest
            pytest app/testAddAluno.py --maxfail=1 --disable-warnings -q
        '''
            }
        }
    }
}
