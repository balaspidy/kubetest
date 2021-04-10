pipeline {
environment {
    namespace1 = "prod"
    namespace2 = "dev"
    port1 = "32333"
    port2 = "32334"
  }
agent any
stages {

stage('Apply Kubernetes files in Prod') {


  when { branch "master" }
    steps {
    git 'https://github.com/balaspidy/jentest.git'
    withKubeConfig([credentialsId: 'kubeid', serverUrl: 'https://10.128.0.7:6443']) {
    sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"'  
    sh 'chmod u+x ./kubectl' 
    sh 'cat frontend.yaml | sed "s/{{namespace}}/$namespace1/g"| sed "s/{{port}}/$port1/g" | `pwd`/kubectl apply -f -'
    }
    }
  }
 
  stage('Apply Kubernetes files in Dev') {
  when { 
         expression {
            return env.BRANCH_NAME != 'master';
        }
  }
    steps {
    git branch: 'test', url: 'https://github.com/balaspidy/jentest.git'
    withKubeConfig([credentialsId: 'kubeid', serverUrl: 'https://10.128.0.7:6443']) {
    sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"'  
    sh 'chmod u+x ./kubectl' 
    sh 'cat frontend.yaml | sed "s/{{namespace}}/$namespace2/g"| sed "s/{{port}}/$port2/g" | `pwd`/kubectl apply -f -'
    }
    }
  }

    }
    }
