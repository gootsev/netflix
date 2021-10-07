pipeline {
  environment {
    registry = "gootsev/netflix"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {    
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$GIT_COMMIT"
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
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$GIT_COMMIT"
      }
    }
  }
}
