pipeline {
    
    agent {
        node {
            label 'web-service-development-server'
        }
    }

    environment {
        VERSION_PRODUCCION  = '4.0.0'
        VERSION_ACTUAL      = '1.0.0'
        NOMBRE_CONTENEDOR   = 'api-transferencias-des'
        NOMBRE_IMAGEN       = 'ws_transferencias'
        PUERTO              = '5003'
        PUERTO_CONTENEDOR   = '80'
        NOMBRE_CARPETA_LOGS = 'wsTransferencias'
    }

    stages {
        
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'docker build -t ${NOMBRE_IMAGEN}:${VERSION_PRODUCCION} --no-cache .'
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
                sh 'docker rm -f ${NOMBRE_CONTENEDOR}'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh  '''docker run --restart=always -it -dp ${PUERTO}:${PUERTO_CONTENEDOR} \
                        --name ${NOMBRE_CONTENEDOR} \
                        -v /app/${NOMBRE_CARPETA_LOGS}:/app/Logs/ \
                        ${NOMBRE_IMAGEN}:${VERSION_PRODUCCION}
                    '''
            }
        }
        stage('Restart') {
            steps {
                echo 'Deploying....'
                 sh 'docker restart ${NOMBRE_CONTENEDOR}'
            }
        }

    }

    post {

        success {
            slackSend color: '#BADA55', message: "Despliegue exitoso  - ${env.JOB_NAME} versión publicada ${VERSION_PRODUCCION} (<${env.BUILD_URL}|Open>)"
        }

        failure {
            sh  'docker rm -f ${PUERTO_CONTENEDOR}'
            sh  '''docker run --restart=always -it -dp ${PUERTO}:${PUERTO_CONTENEDOR} \
                    --name ${NOMBRE_CONTENEDOR} \
                    -v /app/${NOMBRE_CARPETA_LOGS}:/app/Logs/ \
                    ${NOMBRE_IMAGEN}:${VERSION_ACTUAL}
                '''
            slackSend color: '#FE2D00', failOnError:true, message:"Despliegue fallido 😬 - ${env.JOB_NAME} he reversado a la versión ${VERSION_ACTUAL} - (<${env.BUILD_URL}|Open>)"
        }
    }
}

