pipeline {
    agent any
    stages {
        stage('git repo & clean') {
            steps {
               
                sh "git clone https://github.com/Iandreadis/StatisticsDB.sql"
                sh "mvn clean -f StatisticsDB.sql"
            }
        }
        stage('install') {
            steps {
                sh "mvn install -f StatisticsDB.sql"
            }
        }
        stage('test') {
            steps {
                sh "mvn test -f StatisticsDB.sql"
            }
        }
        stage('package') {
            steps {
                sh "mvn package -f StatisticsDB.sql"
            }
        }
    }
}
