terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    bucket         	   = "my-ews-baket8780"
    key              	   = "my-ews-baket8780/Modularized/ECS-Fargate/terraform.tfstate"
    region         	   = "us-east-1"
    encrypt        	   = true
  }
}
