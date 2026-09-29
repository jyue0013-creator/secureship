# secureship

A DevSecOps pipeline for deploying a serverless app on AWS, built with Terraform.

## Architecture
API Gateway → Lambda (Python) → DynamoDB

## Progress
- Day 1: Serverless API deployed with Terraform, using least-privilege IAM and SSO-based access (no long-lived keys) 

TO DO on Day 2:
-  Remote Terraform state in S3
-  CI/CD with GitHub Actions + OIDC
-  Automated security scanning (Checkov, Trivy)
-  Threat detection and alerting (CloudTrail, GuardDuty, SNS)