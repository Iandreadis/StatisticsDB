pipeline {
  agent none

  stages {
    stage("Test back end") {
      agent {
        dockerfile {
          filename "back-end/dockerfiles/ci/Dockerfile"
        }
      }

      steps {
        sh "cd back-end && bin/ci"
      }
    }

    stage("Test front end") {
      agent {
        dockerfile {
          filename "front-end/dockerfiles/ci/Dockerfile"
        }
      }

      steps {
        sh "rm -f front-end/node_modules && ln -s /app/node_modules front-end/node_modules"
        sh "cd front-end && bin/ci"
      }
    }
  }
}
