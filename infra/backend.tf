terraform {
  backend "s3" {
    bucket       = "secureship-tfstate-402545554662"
    key          = "secureship/terraform.tfstate"
    region       = "ap-southeast-2"
    profile      = "secureship"
    encrypt      = true
    use_lockfile = true # prevents two people or processes changing it at once
  }
}