pipeline {
    
    agent {
        node {
            label 'web-service-development-server'
        }
    }

    environment {
        VERSION_PRODUCCION  = '1.0.0'
        VERSION_ACTUAL      = '1.0.0'
        NOMBRE_CONTENEDOR   = 'servicio-transferencias-des'
        NOMBRE_IMAGEN       = 'ws_transferencias'
        PUERTO              = '8003'
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
                        -e SettingsApi__Endpoints__servicio_grpc_sybase=${ENDPOINT_GRPC_SYBASE} \
                        -e SettingsApi__Endpoints__servicio_grpc_mongo=${ENDPOINT_GRPC_MONGO} \
                        -e SettingsApi__Endpoints__servicio_ws_acceso=${ENDPOINT_WS_ACCESO_QA} \
                        -e SettingsApi__Endpoints__servicio_ws_otp=${ENDPOINT_WS_OTP} \
                        -e SettingsApi__Endpoints__servicio_ws_banred=${ENDPOINT_WS_BANRED} \
                        -e SettingsApi__Endpoints__servicio_ws_notificador=${ENDPOINT_WS_NOTIFICADOR} \
                        -e SettingsApi__BasicAuth__auth_ws_transferencias=${AUTH_WS_TRANSFERENCIAS} \
                        -e SettingsApi__BasicAuth__auth_ws_acceso=${AUTH_WS_ACCESO} \
                        -e SettingsApi__BasicAuth__auth_ws_otp=${AUTH_WS_OTP} \
                        -e SettingsApi__BasicAuth__auth_ws_banred=${AUTH_WS_BANRED} \
                        -e SettingsApi__BasicAuth__auth_ws_notificador=${AUTH_WS_NOTIFICADOR} \
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
                    -e SettingsApi__Endpoints__servicio_grpc_sybase=${ENDPOINT_GRPC_SYBASE} \
                    -e SettingsApi__Endpoints__servicio_grpc_mongo=${ENDPOINT_GRPC_MONGO} \
                    -e SettingsApi__Endpoints__servicio_ws_acceso=${ENDPOINT_WS_ACCESO_QA} \
                    -e SettingsApi__Endpoints__servicio_ws_otp=${ENDPOINT_WS_OTP} \
                    -e SettingsApi__Endpoints__servicio_ws_banred=${ENDPOINT_WS_BANRED} \
                    -e SettingsApi__Endpoints__servicio_ws_notificador=${ENDPOINT_WS_NOTIFICADOR} \
                    -e SettingsApi__BasicAuth__auth_ws_transferencias=${AUTH_WS_TRANSFERENCIAS} \
                    -e SettingsApi__BasicAuth__auth_ws_acceso=${AUTH_WS_ACCESO} \
                    -e SettingsApi__BasicAuth__auth_ws_otp=${AUTH_WS_OTP} \
                    -e SettingsApi__BasicAuth__auth_ws_banred=${AUTH_WS_BANRED} \
                    -e SettingsApi__BasicAuth__auth_ws_notificador=${AUTH_WS_NOTIFICADOR} \
                    -v /app/${NOMBRE_CARPETA_LOGS}:/app/Logs/ \
                    ${NOMBRE_IMAGEN}:${VERSION_ACTUAL}
                '''
            slackSend color: '#FE2D00', failOnError:true, message:"Despliegue fallido 😬 - ${env.JOB_NAME} he reversado a la versión ${VERSION_ACTUAL} - (<${env.BUILD_URL}|Open>)"
        }
    }
}


