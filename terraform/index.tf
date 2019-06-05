terraform {
  backend "s3" {
    bucket = "tf-state"
    key = "aws-s3-cognito-lab/terraform.tfstate"
    dynamodb_table = "tf-state"
    region = "cn-northwest-1"
    profile = "zhy"
  }
}

provider "aws" {
  region = var.region
  profile = var.profile
}

data "aws_caller_identity" "current" {}

resource "random_string" "suffix" {
  length = 8
  special = false
  number = false
  upper = false
}

output "domain" {
  value = var.domain
}

output "clientId" {
  value = var.clientId
}

output "redirectUri" {
  value = var.redirectUri
}

output "region" {
  value = var.region
}

output "app" {
  value = var.app
}

output "identityPoolId" {
  value = aws_cognito_identity_pool.identity_pool.id
}

output "bucket" {
  value = aws_s3_bucket.s3.bucket
}
