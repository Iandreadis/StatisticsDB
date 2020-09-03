node{
   stage('SCM Checkout'){
       git credentialsId: 'Iandreadis', url: 'https://github.com/Iandreadis/StatisticsDB.git'
   }

   environment {
    registry = "docker_hub_account/repository_name"
    registryCredential = 'dockerhub'
   }
   
   environment {
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }
   

   
  /* stage('Run Container on Dev Server'){
     def dockerRun = 'docker run -p 3306:3306 -d --name statisticsDB mysql/mysql-server'
     sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no ec2-3-127-66-74.eu-central-1.compute.amazonaws.com ${dockerRun}"
     }
   } */
       
   stage('Build Docker Image'){
     sh 'docker build https://github.com/Iandreadis/StatisticsDB.git/StatisticsDB.sql'
   }
  /* stage('Push Docker Image'){
     withCredentials([string(credentialsId: 'iandreadis', variable: 'iandreadis91')]) {
        sh "docker login -u iandreadis -p ${iandreadis91}"
        sh "docker push iandreadis/newwebapp"
     }
     
   }
   stage('Run Container on Dev Server'){
     def dockerRun = 'docker run -p 8080:8080 -d --name newwebapp iandreadis/newwebapp:latest'
     sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no http://ec2-3-127-66-74.eu-central-1.compute.amazonaws.com:8088/manager/html ${dockerRun}"
     }
   } 
   */
}
