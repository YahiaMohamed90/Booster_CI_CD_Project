pipeline {
    agent {label  'slave'}
    stages {
        stage('Build') {
            steps {
                sh 'docker build -f dockerfile . -t yehiam/jenkins_pymaster:v1.0'
            }
             post{
             success{
                slackSend(color:'#00FF00',message:'successful')
            }
             failure{
                slackSend(color:'#FF0000',message:'failure')
            }
             aborted{
                slackSend(color:'#FFFF00',message:'aborted')
            }
            }
        }
        stage('push') {
            steps {
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId:'docker',usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]){
                sh 'docker login --username $USERNAME --password $PASSWORD'
                sh 'docker push yehiam/jenkins_pymaster:v1.0'
                }
              }
            }
        
        stage('Deploy') {
            steps {
               sh 'docker run -d -p 9090:8000 yehiam/jenkins_pymaster:v1.0'
            }
           
        }
    }
}
