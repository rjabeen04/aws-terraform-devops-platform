# AWS Terraform DevOps Platform

**Production-Style Cloud DevOps Platform using Terraform, Amazon EKS, CloudFront, and GitHub Actions**

---

## 📌 Overview

This repository demonstrates a **real-world, production-style DevOps platform** built using:

- Infrastructure as Code (Terraform)
- Container orchestration with Amazon EKS
- Secure CI/CD using GitHub Actions with OIDC
- Global content delivery via CloudFront

The project mirrors how modern DevOps teams **design, deploy, secure, and operate** cloud infrastructure in AWS following best practices.

---

## 🏗️ Architecture Overview

### Infrastructure
- AWS VPC with public and private subnets
- Remote Terraform state using **S3 + DynamoDB locking**
- Modular Terraform design:
  - Bootstrap layer
  - Environment-specific configuration
  - Reusable modules

### Backend
- Amazon EKS (managed Kubernetes)
- Worker nodes via managed node groups
- Containerized applications
- AWS Load Balancer Controller (ALB Ingress) for traffic routing

### Frontend
- Static frontend hosted in a **private S3 bucket**
- CloudFront CDN with **Origin Access Control (OAC)**
- No public S3 access (CloudFront-only access)

### CI/CD
- GitHub Actions with **OIDC-based IAM role assumption**
- No static AWS credentials stored
- Automated workflows for:
  - Terraform validation and deployment
  - Frontend deployment to S3
  - CloudFront cache invalidation

---

## 🔐 Security Highlights

- No AWS access keys stored in GitHub
- IAM roles assumed using **OIDC**
- Least-privilege IAM policies
- Private S3 bucket accessible only through CloudFront OAC
- Terraform state locking prevents concurrent infrastructure changes

---

## 📂 Repository Structure

```text
aws-terraform-devops-platform/
│
├── app/
│   └── frontend/                 # Static frontend site
│
├── infra/
│   └── terraform/
│       ├── bootstrap/            # S3 + DynamoDB remote state
│       ├── envs/
│       │   └── dev/              # Dev environment
│       └── modules/
│           ├── eks/              # EKS cluster & node groups
│           ├── cdn/              # CloudFront → ALB (API)
│           └── frontend_cdn/     # S3 + CloudFront OAC
│
├── .github/
│   └── workflows/
│       ├── terraform-dev.yml     # Terraform CI/CD
│       └── deploy-frontend.yml   # Frontend CI/CD
│
└── README.md

