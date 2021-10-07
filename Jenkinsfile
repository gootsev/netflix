pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages {
        stage ('Build') {
            steps {
                sh 'docker build -t gootsev/netflix:$GIT_COMMIT .'
                }
            }
        }
        stage ('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage ('Push') {
            steps {
                sh 'docker push gootsev/netflix:$GIT_COMMIT'
            }
        }
        stage ('Cleaning') {
            steps {
                sh 'docker rmi gootsev/netflix:$GIT_COMMIT'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
