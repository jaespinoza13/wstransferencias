pipeline {
    agent any

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
                 sh 'docker rm -f service-transferencias'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                 sh 'docker run -it --rm -e TZ=America/Guayaquil -dp  8003:80 --name service-transferencias wstransferencias'
            }
        }
        stage('Restart') {
            steps {
                echo 'Deploying....'
                 sh 'docker restart service-transferencias'
            }
        }

    }
}

