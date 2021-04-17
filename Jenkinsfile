pipeline{
    environment{
        registry = "hdung1091/hello-nodejs"
        registryCredential = 'dockerhub_id'
        dockerImage=''
    }
    agent any
    
    stages(){
        stage('Clone GitHub'){
            steps{
                git 'https://github.com/bhdung/hello-nodejs.git'
            }
        }
        stage('Build Image Docker'){
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy Image Dockerhub.io'){
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
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}