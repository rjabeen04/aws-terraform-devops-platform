module "vpc" {
  source   = "../../modules/vpc"
  project  = "aws-terraform-devops-platform"
  vpc_cidr = "10.20.0.0/16"
}

