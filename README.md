AWS Terraform DevOps Platform

Production-Style Cloud DevOps Platform using Terraform, Amazon EKS, CloudFront, and GitHub Actions

📌 Overview

This repository demonstrates a real-world, production-style DevOps platform built using Infrastructure as Code (Terraform), container orchestration with Amazon EKS, secure CI/CD using GitHub Actions with OIDC, and global content delivery via CloudFront.

The project mirrors how modern DevOps teams design, deploy, secure, and operate cloud infrastructure in AWS, following best practices for security, scalability, and automation.

🏗️ Architecture Overview
Infrastructure

AWS VPC with public and private subnets

Remote Terraform state using S3 with DynamoDB state locking

Modular Terraform design:

Bootstrap layer

Environment-specific configuration

Reusable modules

Backend

Amazon EKS (managed Kubernetes)

Worker nodes via managed node groups

Containerized applications

AWS Load Balancer Controller (ALB Ingress) for traffic routing

Frontend

Static frontend hosted in a private S3 bucket

CloudFront CDN with Origin Access Control (OAC)

No public S3 access (CloudFront-only access)

CI/CD

GitHub Actions with OIDC-based IAM role assumption

No static AWS credentials stored

Automated workflows for:

Terraform validation and deployment

Frontend deployment to S3

CloudFront cache invalidation

🔐 Security Highlights

No AWS access keys stored in GitHub

IAM roles assumed via OIDC

Least-privilege IAM policies

Private S3 bucket accessible only through CloudFront OAC

Terraform state locking prevents concurrent infrastructure changes

📂 Repository Structure
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
│       └── deploy-frontend.yml   # Frontend deployment
│
└── README.md

🚀 CI/CD Workflows
Terraform (Dev)

Triggered on push to main

Executes:

terraform fmt

terraform init

terraform validate

terraform plan / terraform apply

Uses GitHub Actions OIDC → IAM Role for authentication

Frontend Deployment

Triggered on changes to app/frontend/**

Syncs frontend assets to a private S3 bucket

Automatically invalidates CloudFront cache

🌍 Live Endpoints
Frontend (S3 + CloudFront)
https://d20304u7xc8x2a.cloudfront.net

Backend API (CloudFront + ALB + EKS)
https://d39zuh5aq95a3f.cloudfront.net

🧠 What This Project Demonstrates

Real-world Terraform patterns used in production

Secure CI/CD pipelines with GitHub Actions and OIDC

Kubernetes workloads deployed on AWS EKS

CloudFront CDN in front of:

Static frontend (S3)

Backend APIs (ALB + EKS)

Strong IAM least-privilege design

End-to-end DevOps ownership from infrastructure to deployment

🏁 Status

✅ Infrastructure deployed
✅ CI/CD pipelines operational
✅ Frontend and backend live
✅ Production-style architecture complete
