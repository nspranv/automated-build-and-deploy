pipeline {
    agent any

    stages {
        stage('stage-1') {
            steps {
                echo 'Hello everyone from Jenkins'
            }
        }
        stage('git clone'){
            steps {
                git branch: 'main', url: 'https://github.com/nspranv/automated-build-and-deploy'
            }
        }
    }
    post{
        failure{
            emailext to: "pranavdhar.nalamalapu@sap.com",
            subject: "jenkins build:${currentBuild.currentResult}: ${env.JOB_NAME}",
            body: "${currentBuild.currentResult}: Job ${env.JOB_NAME}\nMore Info can be found here: ${env.BUILD_URL}",
            attachLog: true
        }
        success{
            emailext to: "pranavdhar.nalamalapu@sap.com",
            subject: "jenkins build:${currentBuild.currentResult}: ${env.JOB_NAME}",
            body: "${currentBuild.currentResult}: Job ${env.JOB_NAME}\nMore Info can be found here: ${env.BUILD_URL}",
            attachLog: true
        }
    }
}
