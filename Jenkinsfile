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
                 sh 'docker build -t ws_transferencias --no-cache .'
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
                sh 'docker rm -f servicio-transferencias-des'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh  '''docker run --restart=always -it -dp 9003:80 \
                        --name servicio-transferencias-des \
                        -e ServiceSettings__Endpoints__servicio_grpc_sybase=${ENDPOINT_GRPC_SYBASE} \
                        -e ServiceSettings__Endpoints__servicio_grpc_mongo=${ENDPOINT_GRPC_MONGO} \
                        -e ServiceSettings__Endpoints__servicio_ws_acceso=${ENDPOINT_WS_ACCESO} \
                        -e ServiceSettings__Endpoints__servicio_ws_otp=${ENDPOINT_WS_OTP} \
                        -e ServiceSettings__Endpoints__servicio_ws_alfresco=${ENDPOINT_WS_ALFRESCO} \
                        -e ServiceSettings__Endpoints__servicio_ws_notificador=${ENDPOINT_WS_NOTIFICADOR} \
                        -e ServiceSettings__BasicAuth__auth_ws_acceso=${AUTH_WS_ACCESO} \
                        -e ServiceSettings__BasicAuth__auth_ws_ahorro_proposito=${AUTH_WS_AHORRO_PROPOSITO} \
                        -e ServiceSettings__BasicAuth__auth_ws_notificador=${AUTH_WS_NOTIFICADOR} \
                        -e ServiceSettings__BasicAuth__auth_ws_otp=${AUTH_WS_OTP} \
                        -v /app/wsTransferencias:/app/Logs/ ws_transferencias 
                    '''
            }
        }
        stage('Restart') {
            steps {
                echo 'Deploying....'
                 sh 'docker restart servicio-transferencias-des'
            }
        }

    }
}


