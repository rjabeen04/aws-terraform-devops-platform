module "vpc" {
  source   = "../../modules/vpc"
  project  = "aws-terraform-devops-platform"
  vpc_cidr = "10.20.0.0/16"
}

module "eks" {
  source  = "../../modules/eks"
  project = "aws-terraform-devops-platform"

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  public_subnets  = module.vpc.public_subnets

  cluster_version = "1.29"
}
module "cdn" {
  source       = "../../modules/cdn"
  project      = "aws-terraform-devops-platform"
  alb_dns_name = "k8s-demo-echoingr-0205552327-1209739194.us-east-1.elb.amazonaws.com"
}

module "frontend_cdn" {
  source      = "../../modules/frontend_cdn"
  project     = "aws-terraform-devops-platform"
  bucket_name = "aws-terraform-devops-platform-frontend-716147851058"
}







