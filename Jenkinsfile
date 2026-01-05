pipeline {
    agent any

    environment {
        IMAGE_NAME = "vinyo423/myapp"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/vinodshivkumar4/Docker_Demo.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def BUILD_TAG = "v${BUILD_NUMBER}"
                    sh "docker build -t ${IMAGE_NAME}:${BUILD_TAG} ."
                    sh "docker tag ${IMAGE_NAME}:${BUILD_TAG} ${IMAGE_NAME}:latest"
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push ${IMAGE_NAME}:v${BUILD_NUMBER}
                        docker push ${IMAGE_NAME}:latest
                    '''
                }
            }
        }
    }

    post {
        success {
            mail to: 'vinodshivkumar4@gmail.com',
                 subject: "Build SUCCESS: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                 body: "The Jenkins build succeeded! See details: ${env.BUILD_URL}"
        }
        failure {
            mail to: 'vinodshivkumar4@gmail.com',
                 subject: "Build FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                 body: "The Jenkins build failed! See details: ${env.BUILD_URL}"
        }
    }
}
