pipeline {
    agent any
    stages {
        stage('git repo & clean') {
            steps {
               
                sh "git clone https://github.com/Iandreadis/StatisticsDB.git"
                sh "mvn clean -f StatisticsDB"
            }
        }
        stage('install') {
            steps {
                sh "mvn install -f StatisticsDB"
            }
        }
        stage('test') {
            steps {
                sh "mvn test -f StatisticsDB"
            }
        }
        stage('package') {
            steps {
                sh "mvn package -f StatisticsDB"
            }
        }
    }
}
