Autor: Felipe Marques da Silva

# Projeto Final - Ambiente Monitorado com Pipeline CI/CD

Este projeto tem como objetivo criar um ambiente completo para desenvolvimento e monitoramento, com suporte a CI/CD, utilizando tecnologias como Flask, MariaDB, Jenkins, Prometheus e Grafana. 

## Tecnologias Utilizadas

- **Flask**: Framework para a aplicação backend.
- **MariaDB**: Banco de dados relacional para persistência de dados.
- **Prometheus**: Ferramenta de monitoramento e alertas.
- **Grafana**: Visualização de métricas e dashboards.
- **Jenkins**: Ferramenta de CI/CD para automação do pipeline.
- **Docker**: Containerização de serviços.
- **Pytest**: Framework de testes para Python.

## Configuração do Ambiente

### Pré-requisitos

Certifique-se de ter os seguintes softwares instalados:

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Jenkins](https://www.jenkins.io/) (separado ou em contêiner)

### Passos para Configuração

1. Clone o repositório:

   ```bash
   git clone https://github.com/FeMarquesSilva/Trabalho_DevOps_22.8883-5.git

Configure o arquivo .env (se necessário) para o exportador MySQL no diretório exporter/.
Certifique-se de que os arquivos de configuração, como prometheus.yml e datasources.yml, estão ajustados conforme as suas necessidades.

Como Executar
Inicie os contêineres:

docker-compose build --no-cache

docker-compose up -d

Acesse os serviços 'localhoust':

![image](https://github.com/user-attachments/assets/37fda319-f5c3-4424-bc91-a71a0efd0ab4)


Configuração do Grafana:

Faça login no Grafana (admin/admin).
![image](https://github.com/user-attachments/assets/9995dae5-4779-4407-924a-e19f9019fd65)
![image](https://github.com/user-attachments/assets/c30b2e07-5d87-4c93-8dae-a9857dcc1881)

Configuração do App Flask:

Faça login:

*User: admin

*senha: admin
![image](https://github.com/user-attachments/assets/d7cde5fe-4f52-44cc-9f04-3540e9151ceb)

Acesse a guia Alunos e veja a Lista de alunos:

![image](https://github.com/user-attachments/assets/e48d76c3-efd0-47fc-97a9-fadb72b32e6a)


Pipeline CI/CD:

Configure o Jenkins para utilizar o Jenkinsfile.
Ajuste as credenciais no Jenkins para integração com o repositório e o Docker.



Monitoramento

Prometheus: Coleta métricas de todos os serviços registrados.
Grafana: Visualiza as métricas coletadas no Prometheus, incluindo o desempenho do MariaDB.
Problemas Conhecidos
Certifique-se de que as dependências no requirements.txt estão alinhadas com as versões corretas para evitar incompatibilidades.
O tempo de espera para inicialização do Flask pode precisar de ajustes dependendo do ambiente.
