pipeline {
environment {
    namespace1 = "prod"
    namespace2 = "dev"
    port1 = "32333"
    port2 = "32334"
    registry1 = "spidybala/nginx-prd"
    registry2 = "spidybala/nginx-dev"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
agent any
stages {
    
stage('Docker build for Prod') {
 when { branch "master" }
    steps {
      script {
          dockerImage = docker.build registry1 + ":$BUILD_NUMBER"
         
      }
    }
} 
    
stage('Docker build for Prod') {
 when { 
     expression {
            return env.BRANCH_NAME != 'master';
 }
 }
    steps {
      script {
          dockerImage = docker.build registry2 + ":$BUILD_NUMBER"
         
      }
    }
}
    
 stage('Push image') {
     steps{
         script{
        withDockerRegistry(credentialsId: "dockerhub", url: "") {
        dockerImage.push()
        }
 }
     }
 }      
}
}

