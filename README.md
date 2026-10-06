# secureship

![Terraform](https://github.com/jyue0013-creator/secureship/actions/workflows/terraform.yml/badge.svg)
A DevSecOps pipeline for deploying a serverless app on AWS, built with Terraform.

## Architecture
API Gateway → Lambda (Python) → DynamoDB

## Progress
- Day 1: Serverless API deployed with Terraform, using least-privilege IAM and SSO-based access (no long-lived keys) 

- Day 2: Remote Terraform state in S3 (versioned, encrypted, public access blocked, native locking)

- Day3: CI/CD with GitHub Actions — OIDC login (no stored AWS keys), automated fmt/validate/plan, auto-deploy on push to main

- TODO Day4:
**Next up**
- Add security scanning to the pipeline (Checkov for Terraform, Trivy for code)
- Fail the build on high-severity issues

**Later**
- [ ] Reorganise Terraform into reusable modules
- [ ] Add network design: VPC, private subnets, DynamoDB VPC endpoint, flow logs 