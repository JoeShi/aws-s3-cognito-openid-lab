variable "app" {
  default = "cannon"
}

variable "region" {
  default = "cn-north-1"
}

# Your local AWS credentials profile
variable "profile" {
  default = "zhy"
}

variable "redirectUri" {
  default = "http://localhost:3000/callback"
}

# Provider domain, NOT include https
variable "domain" {
  default = "aws-cognito.auth0.com"
}

# OpenID Connect applcation clientID
variable "clientId" {
  default = "n4JmCUjAA4P7cEIEC3KI9yy8Kt4COqOt"
}

# The Identity Provider ARN created in IAM
variable "openid_provider_arn" {
  default = "arn:aws-cn:iam::057005827724:oidc-provider/aws-cognito.auth0.com"
}
