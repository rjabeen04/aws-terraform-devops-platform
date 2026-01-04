terraform {
  backend "s3" {
    bucket         = "tf-state-aws-terraform-devops-platform-f3135f53"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-lock-aws-terraform-devops-platform"
    encrypt        = true
  }
}

