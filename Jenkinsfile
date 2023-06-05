pipeline {
  agent any
  
  stages {
    stage('Build') {
      steps {
        // Checkout source code from repository
        git 'https://github.com/Navyagowda-1234/public-repo'
        
        // Build Docker image
        sh 'docker build -t webapp.'
      }
    }
    
    stage('Push to Registry') {
      steps {
        // Log in to container registry
        withDockerRegistry([credentialsId: 'navyagowda123', variable: 'Navya@123']) {
          // Push Docker image to registry
          sh 'docker push ec2-user/webapp'
        }
      }
    }
    
    stage('Deploy') {
      steps {
        // Connect to EC2 instance
        sshagent(['aws1']) {
          // Deploy Docker image on EC2
          sh 'ssh ec2-user@ec2-13-250-107-193.ap-southeast-1.compute.amazonaws.com "docker run -d ec2-user/webapp"'
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
