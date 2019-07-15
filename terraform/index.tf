provider "aws" {
  region = var.region
  profile = var.profile
}

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
