pipeline {
        agent any

        stages {
            stage('Build') {
                steps {
                    echo 'This is Build Stage'
                    sh "docker build -t notes-app-cicd ."
                }
            }
            stage('Push to Docker hub') {
                 steps {
                     echo 'Pushing image to dockerhub'
                     withCredentials([usernamePassword(credentialsId:"dockerhub-id",passwordVariable:"dockerhubpass",usernameVariable:"dockerhubuser" )]){
                     sh "docker tag notes-app-cicd ${env.dockerhubuser}/notes-app-cicd:latest"
                     sh "docker login -u ${env.dockerhubuser} -p ${env.dockerhubpass}" 
                     sh "docker push ${env.dockerhubuser}/notes-app-cicd:latest"
                     }

                 }
            }
            stage('Deployement') {
                steps {
                    echo 'Deploying container'
                    sh "docker ps -a"
                    sh "docker rm -f notes-app-container"
                    sh "docker run -d --name notes-app-container -p 80:80 notes-app-cicd"
                }
            }
        }
    }
