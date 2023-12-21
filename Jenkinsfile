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
        stage('Init') {
            steps {
                withAWS(credentials: 'jenkins-environment', region: 'us-east-1') {
                    sh "terraform -chdir=..Modules/Terraform-ECS-Fargate/"
                    sh "terraform init --lock=false"
                
                }
            }
        }
        stage('Action') {
            steps {
                echo "${params.Terraform_Action}"
                withAWS(credentials: 'jenkins-environment', region: 'us-east-1') {
                sh 'terraform get -update'
                script {    
                        if (params.Terraform_Action == 'plan') {
                            sh 'terraform -chdir=./Modules/Terraform-ECS-Fargate/ plan'
                        }   else if (params.Terraform_Action == 'apply') {
                            sh 'terraform -chdir=./Modules/Terraform-ECS-Fargate/ apply -auto-approve --lock=false'
                        }   else if (params.Terraform_Action == 'destroy') {
                            sh 'terraform -chdir=./Modules/Terraform-ECS-Fargate/ destroy -auto-approve --lock=false'
                        } else {
                            error "Invalid value for Terraform_Action: ${params.Terraform_Action}"
                        }
                    }
                }
            }
        }
    }
}
