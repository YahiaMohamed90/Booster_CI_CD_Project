pipeline {
    agent { label 'slave' }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -f dockerfile . -t yehiam90/go_web_abb:v1.0'
            }
        }
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId:"docker",usernameVariable:"USERNAME",passwordVariable:"PASSWORD")]){
             
                
                sh 'docker login --username $USERNAME --password $PASSWORD'
                sh 'docker push  yehiam90/go_web_abb:v1.0'
            }
           
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -d -p 5050:6060 yehiam90/go_web_abb:v1.0'
            }
        
        }
    }
     
     post {
      success {
      slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
      }

      failure {
      slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
      }

      aborted {
      slackSend (color: '#000000', message: "ABORTED: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
      }
    }
     
     
    }
