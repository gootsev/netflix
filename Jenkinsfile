pipeline {
  environment {
    registry = "gootsev/netflix"
    registryCredential = 'dockerhub'
    dockerImage = ''
    MAX_INSTANCES=2
    BUCKET="gootsev-next-netflix"
    AWS_DEFAULT_REGION="eu-west-1"
    STACK_NAME="mynetflix"
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
    stage ('Deploy AWS') {
            steps{
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh '''
                        aws cloudformation update-stack --stack-name $STACK_NAME --template-body file://infrastructure.yaml --parameters ParameterKey=MaxInstances,ParameterValue=$MAX_INSTANCES ParameterKey=DockerContainerTag,ParameterValue=$GIT_COMMIT ParameterKey=BucketName,ParameterValue=$BUCKET --capabilities CAPABILITY_IAM
                    '''
                }
            }
        }
  }
}
