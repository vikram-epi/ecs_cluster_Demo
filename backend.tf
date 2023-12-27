terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    bucket         	   = "my-ews-baket87-80"
    key              	   = "my-ecs-bucket87-80/ECS-Fargate/terraform.tfstate"
    region         	   = "us-east-1"
    encrypt        	   = true
  }
}
