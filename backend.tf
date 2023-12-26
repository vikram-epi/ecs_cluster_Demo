terraform {
required_version = ">=0.13.0"
backend "s3" {
    bucket         = "my-ews-baket8780"
    region         = "us-east-1"
    key            = "Modularized/ECS-Fargate/terraform.tfstate"
    encrypt        = true
  }
}
