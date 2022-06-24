pipeline {
    
    agent {
        node {
            label 'web-service-production-server-prueba'
        }
    }


    environment {
        VERSION_PRODUCCION  = '3.0.0'
        VERSION_ACTUAL      = '2.0.0'
        NOMBRE_CONTENEDOR   = 'servicio-transferencias'
        NOMBRE_IMAGEN       = 'ws_transferencias'
        PUERTO              = '9003'
        PUERTO_CONTENEDOR   = '80'
        RUTA_LOGS           = 'wsTransferencias'
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
                        -v ${RUTA_LOGS}:/app/Logs/ \
                        -e TZ=${TZ} \
                        -e secretKey=${SECRETKEY} \
                        -e issuer=${ISSUER} \
                        -e ApiSettings__GrpcSettings__client_grpc_sybase=${ENDPOINT_GRPC_SYBASE} \
                        -e ApiSettings__GrpcSettings__client_grpc_mongo=${ENDPOINT_GRPC_MONGO} \
                        -e ApiSettings__Endpoints__servicio_ws_otp=${ENDPOINT_WS_OTP} \
                        -e ApiSettings__Endpoints__servicio_ws_alfresco=${ENDPOINT_WS_ALFRESCO} \
                        -e ApiSettings__Endpoints__servicio_ws_banred=${ENDPOINT_WS_BANRED} \
                        -e ApiSettings__EndpointsAuth__auth_ws_transferencias=${AUTH_WS_TRANSFERENCIAS} \
                        -e ApiSettings__EndpointsAuth__auth_ws_otp=${AUTH_WS_OTP} \
                        -e ApiSettings__EndpointsAuth__auth_ws_banred=${AUTH_WS_BANRED} \
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
            sh  'docker rm -f ${NOMBRE_CONTENEDOR}'
            sh  '''docker run --restart=always -it -dp ${PUERTO}:${PUERTO_CONTENEDOR} \
                    --name ${NOMBRE_CONTENEDOR} \
                    -v ${RUTA_LOGS}:/app/Logs/ \
                    -e TZ=${TZ} \
                    -e secretKey=${SECRETKEY} \
                    -e issuer=${ISSUER} \
                    -e ApiSettings__GrpcSettings__client_grpc_sybase=${ENDPOINT_GRPC_SYBASE} \
                    -e ApiSettings__GrpcSettings__client_grpc_mongo=${ENDPOINT_GRPC_MONGO} \
                    -e ApiSettings__Endpoints__servicio_ws_otp=${ENDPOINT_WS_OTP} \
                    -e ApiSettings__Endpoints__servicio_ws_alfresco=${ENDPOINT_WS_ALFRESCO} \
                    -e ApiSettings__Endpoints__servicio_ws_banred=${ENDPOINT_WS_BANRED} \
                    -e ApiSettings__EndpointsAuth__auth_ws_transferencias=${AUTH_WS_TRANSFERENCIAS} \
                    -e ApiSettings__EndpointsAuth__auth_ws_otp=${AUTH_WS_OTP} \
                    -e ApiSettings__EndpointsAuth__auth_ws_banred=${AUTH_WS_BANRED} \
                    ${NOMBRE_IMAGEN}:${VERSION_ACTUAL}
                '''
            slackSend color: '#FE2D00', failOnError:true, message:"Despliegue fallido 😬 - ${env.JOB_NAME} he reversado a la versión ${VERSION_ACTUAL} - (<${env.BUILD_URL}|Open>)"
        }
    }
}

