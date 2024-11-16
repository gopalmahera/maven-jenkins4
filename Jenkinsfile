pipeline {
    agent any
    stages {
        stage('Download Code from Git') {
            steps {
                echo "Downloading code from Git"
                git branch: 'main', url: 'https://github.com/gopalmahera/maven-jenkins4.git'
            }
        }
        stage('build') {
            steps {
                sh '''docker build -t gopalmahera/webapp:v${BUILD_NUMBER} .
                    docker tag gopalmahera/webapp:v${BUILD_NUMBER} gopalmahera/webapp:latest
                    docker push gopalmahera/webapp:v${BUILD_NUMBER}
                    docker push gopalmahera/webapp:latest'''
            }
        }
    }
}
