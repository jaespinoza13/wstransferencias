pipeline {
    
    agent {
        node {
            label 'web-service-development-server'
        }
    }

    stages {
        
        stage('Build') {
            steps {
                echo 'Building..'
                 sh 'docker build -t wstransferencias --no-cache .'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Clean') {
            steps {
                echo 'Cleaning..'
                 sh 'docker rm -f servicio-transferencias'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                 sh 'docker run -it --restart unless-stopped -e TZ=America/Guayaquil -dp  8050:80 --name servicio-transferencias wstransferencias'
            }
        }
        stage('Restart') {
            steps {
                echo 'Deploying....'
                 sh 'docker restart servicio-transferencias'
            }
        }

    }
}

