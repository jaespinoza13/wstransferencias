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
                 sh 'docker-compose build --no-cache --no-rm'
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
                sh 'docker rm -f servicio-transferenciasdev'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'docker-compose up -d '                 
            }
        }
        stage('Restart') {
            steps {
                echo 'Deploying....'
                 sh 'docker restart servicio-transferenciasdev'
            }
        }

    }
}

