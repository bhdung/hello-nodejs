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
                sh "docker image rm $registry:$BUILD_NUMBER"
            }
        }
        stage('Run Docker Images Latest') {
            steps{
                sh "docker stop app-nodejs-demo && docker rm app-nodejs-demo"
                sh "docker run -td --name app-nodejs-demo -p 3000:3000 $registry:$BUILD_NUMBER"
 
            }
        }
        stage('Cleanup Images on Host'){
            steps{
                sh "docker image prune -a --force"
            }
        }
    }
//    post (
//        subject: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
//        body: """<p>STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
//        <p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
//        recipientProviders: [[$class: 'DevelopersRecipientProvider']]
//    )
//    post {
//        always {
//            emailext body: """<p>STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p><p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""", recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], subject: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
//        }
//    }
}