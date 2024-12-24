pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "asaleh37/react-app"
        K8S_NAMESPACE = "default"
        K8S_DEPLOYMENT_NAME = "react-app"
        K8S_CONFIG = "/path/to/kubeconfig"  // Optional if Jenkins has direct access to Kubernetes
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/asaleh37/react-app.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        
        // stage('Run Tests') {
        //     steps {
        //         script {
        //             // Run React tests (e.g., using Jest)
        //             sh 'npm install'
        //             sh 'npm run test -- --coverage'
        //         }
        //     }
        // }
        
        // stage('Push Docker Image') {
        //     steps {
        //         script {
        //             docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials-id') {
        //                 docker.image(DOCKER_IMAGE).push('latest')
        //             }
        //         }
        //     }
        // }
        
        // stage('Deploy to Kubernetes') {
        //     steps {
        //         script {
        //             // Apply Kubernetes deployment and service manifests
        //             sh 'kubectl --kubeconfig=$K8S_CONFIG set image deployment/$K8S_DEPLOYMENT_NAME react-app=$DOCKER_IMAGE:latest --namespace=$K8S_NAMESPACE'
        //         }
        //     }
        // }
    }
    
    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
