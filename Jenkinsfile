properties([parameters([choice(choices: ['Terraform-ECS-Fargate'], name: 'Terraform-ECS-Fargate'), choice(choices: ['plan', 'apply', 'destroy'], name: 'Terraform_Action')])])
pipeline {
    agent any
    environment {
        registry = "public.ecr.aws/g2b6m8b9/helloworldrepo"
    }    
    stages {
        stage('Preparing') {
            steps {
                sh 'echo Preparing'
            }
        }
        stage('Git Pulling') {
            steps {
                git branch: 'main', url: 'https://github.com/vikram-epi/ecs_cluster_Demo.git'
            }
        }
        stage('Build docker image') {
            steps {
                script {
                    docker.build registry
                }
            }
        }
        stage('Push into ECR') {
            steps {
                sh"aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/g2b6m8b9"
                sh"docker build -t helloworldrepo ."
                sh"docker tag helloworldrepo:latest public.ecr.aws/g2b6m8b9/helloworldrepo:latest"
                sh"docker push public.ecr.aws/g2b6m8b9/helloworldrepo:latest"
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
        stage('Upload State to S3') {
            steps {
                script {
                    sh 'aws s3 cp terraform.tfstate s3://your-bucket-name'
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
         
    }
