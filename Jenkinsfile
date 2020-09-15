pipeline{
    
  environment {
    registry = "iandreadis/newwebapp"
    registryCredential = 'Docker'
  
     AWS_ACCESS_KEY_ID     = credentials('AKIAJZ4P46WFF3O2NMSA')
     AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
   }
    agent any
        stages{
   
   stage('SCM Checkout'){
       git credentialsId: 'Iandreadis', url: 'https://github.com/Iandreadis/StatisticsDB.git/StatisticsDB.sql'
   }

 
      stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
 }
    /*
   // check if docker is installed  (if reports "installed" it is installed)
  // stage('execute command in mysql in docker'){
      
     // sh "docker exec -i mysql-latest mysql -u root --password=strongpassword -e 'show databases;'"
 //  }
   
/*   stage('Run Container on Dev Server'){
     def dockerRun = 'docker run -p 3306:3306 -d --name statisticsDB mysql/mysql-server'
     sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no ec2-3-127-66-74.eu-central-1.compute.amazonaws.com ${dockerRun}"
     }
   } 
       */
/*    stage('Build Docker Image'){
      sh 'docker build https://github.com/Iandreadis/StatisticsDB.git/StatisticsDB.sql'
   } */
   
   /*stage('Push Docker Image'){
     withCredentials([string(credentialsId: 'iandreadis', variable: 'iandreadis91')]) {
        sh "docker login -u iandreadis -p ${iandreadis91}"
        sh "docker push iandreadis/newwebapp"
     }
     
   }
   */
   /*stage('Run Container on Dev Server'){
     def dockerRun = 'docker run -p 8080:8080 -d --name newwebapp iandreadis/newwebapp:latest'
     sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no http://ec2-3-127-66-74.eu-central-1.compute.amazonaws.com:8088/manager/html ${dockerRun}"
     }
   } 
   */

}
