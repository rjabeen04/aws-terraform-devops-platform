output "vpc_id" { value = module.vpc.vpc_id }
output "public_subnets" { value = module.vpc.public_subnets }
output "private_subnets" { value = module.vpc.private_subnets }

output "eks_cluster_name" { value = module.eks.cluster_name }
output "eks_cluster_endpoint" { value = module.eks.cluster_endpoint }

output "cloudfront_domain_name" {
  value = module.cdn.cloudfront_domain_name
}

output "frontend_bucket_name" {
  value = module.frontend_cdn.bucket_name
}

output "frontend_cloudfront_domain" {
  value = module.frontend_cdn.cloudfront_domain_name
}

