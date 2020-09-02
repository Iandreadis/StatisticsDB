node{
   stage('SCM Checkout'){
       git credentialsId: 'Iandreadis', url: 'https://github.com/Iandreadis/StatisticsDB.git'
   }

       
   stage('Build Docker Image'){
     sh 'docker build -t iandreadis/newwebapp:latest .'
   }
   stage('Push Docker Image'){
     withCredentials([string(credentialsId: 'iandreadis', variable: 'iandreadis91')]) {
        sh "docker login -u iandreadis -p ${iandreadis91}"
     }
     sh 'docker push iandreadis/newwebapp'
   }
   stage('Run Container on Dev Server'){
     def dockerRun = 'docker run -p 8080:8080 -d --name newwebapp iandreadis/newwebapp:latest'
     sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no http://ec2-3-127-66-74.eu-central-1.compute.amazonaws.com:8088/manager/html ${dockerRun}"
     }
   }
}
