pipeline {
  agent any
  stages{
    stage('Checkout'){
      steps{
        git branch: 'main',
        url: 'https://github.com/sayeda-77/Reactapp-Project.git'
      }
    }
  
    stage('Build and Push Docker Image') {
      steps{
      // Grant executable permissions to the build script
        sh 'chmod +x build.sh'
      // Build the Docker Image using the build script
        sh './build.sh'
      // Log in to Docker Hub (private rrepository) using your credentials
        withCredentials ([usernamePassword(credentialsId:'docker',usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')])
            sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD docker.io"
      }  
    // Tag the Docker image with the customized tag
        sh "docker tag react-appimg $DOCKERHUB_PRIVATE_REPO"
    // Push the Docker image to the public DOCKER Hub repository with the customized tag
        sh "docker push $DOCKERHUB_PRIVATE_REPO"
    }
}
}
