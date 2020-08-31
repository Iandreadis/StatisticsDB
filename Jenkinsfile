node{
   stage('SCM Checkout'){
       git credentialsId: 'Iandreadis', url: 'https://github.com/Iandreadis/StatisticsDB.git'
   }
   stage('Mvn Package'){
     withMaven(
        // Maven installation declared in the Jenkins "Global Tool Configuration"
        maven: 'maven-3',
        // Maven settings.xml file defined with the Jenkins Config File Provider Plugin
        // We recommend to define Maven settings.xml globally at the folder level using 
        // navigating to the folder configuration in the section "Pipeline Maven Configuration / Override global Maven configuration"
        // or globally to the entire master navigating to  "Manage Jenkins / Global Tools Configuration"
        mavenSettingsConfig: 'my-maven-settings') {

      // Run the maven build
      sh "mvn clean verify"
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
