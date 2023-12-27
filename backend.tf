terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    bucket         	   = "my-ecs-bucket87-80"
    key              	   = "ECS-Fargate/terraform.tfstate"
    region         	   = "us-east-1"
    encrypt        	   = true
  }
}
