pipeline {
    agent any
    stages {
        stage('git repo & clean') {
            steps {
               bat "rmdir  /s /q StatisticsDB"
                bat "git clone https://github.com/Iandreadis/StatisticsDB.git"
                bat "mvn clean -f StatisticsDB"
            }
        }
        stage('install') {
            steps {
                bat "mvn install -f StatisticsDB"
            }
        }
        stage('test') {
            steps {
                bat "mvn test -f StatisticsDB"
            }
        }
        stage('package') {
            steps {
                bat "mvn package -f StatisticsDB"
            }
        }
    }
}
