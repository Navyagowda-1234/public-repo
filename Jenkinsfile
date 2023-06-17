pipeline {
  agent any
  
  stages {
    stage('Build Docker image') {
      steps {
        // Checkout source code from repository
        git 'https://github.com/Navyagowda-1234/public-repo.git'
      }
    }
    stage("building Docker image"){
      steps{
          sh 'docker build --name webapp:1.0 .'
	}
    }
    
    stage('Push to Registry') {
      steps {
        // Log in to container registry
        withDockerRegistry([credentialsId: 'navyagowda123', variable: 'Navya@123']) {
          // Push Docker image to registry
          sh 'docker push jenkins/webapp'
        }
      }
    }
    
    stage('Deploy') {
      steps {
        // Connect to EC2 instance
        sshagent(['aws1']) {
          // Deploy Docker image on EC2
          sh 'ssh ec2-user@ec2-18-141-159-223.ap-southeast-1.compute.amazonaws.com "docker run -d jenkins/webapp"'
        }
      }
    }
    
    stage('Archving') { 
      steps {
        archiveArtifacts '**/target/*.jar'
       }
     }
  }
}
