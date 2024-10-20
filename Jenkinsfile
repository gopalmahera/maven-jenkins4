pipeline {
    agent any
    tools {
        maven 'maven'
        jdk 'java'
    }
    stages {
        stage('Download Code from Git') {
            steps {
                echo "Downloading code from Git"
                git branch: 'main', url: 'https://github.com/gopalmahera/maven-jenkins4.git'
            }
        }
        stage('Build') {
            steps {
                echo "Building code"
                sh 'mvn clean package'
            }
        }
        stage('Archive the Artifact') {
            steps {
                echo "Archiving artifact"
                archiveArtifacts artifacts: '**/*.war', followSymlinks: false
            }
        }
        stage('Trigger Deploy Job') {
            steps {
                echo "Triggering deploy job"
                build job: 'pipeline-deploy', wait: false
            }
        }
    }
}
