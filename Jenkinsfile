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
                sh 'docker rm -f servicio-transferencias-dev'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'docker-compose up --no-deps -d app'                 
            }
        }
        stage('Restart') {
            steps {
                echo 'Deploying....'
                 sh 'docker restart servicio-transferencias-dev'
            }
        }

    }
}

