# secureship

A DevSecOps pipeline for deploying a serverless app on AWS, built with Terraform.

## Architecture
API Gateway → Lambda (Python) → DynamoDB

## Progress
- Day 1: Serverless API deployed with Terraform, using least-privilege IAM and SSO-based access (no long-lived keys) 

- Day 2: Remote Terraform state in S3 (versioned, encrypted, public access blocked, native locking)

TO DO Day3
- Create an IAM OIDC role so GitHub Actions can access AWS (no stored keys)
- Add a GitHub Actions workflow that runs `terraform fmt`, `validate` and `plan` on every push
- Auto-run `terraform apply` on merges to `main`
- Add a pipeline status badge to the README