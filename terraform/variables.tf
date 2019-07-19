# 应用名称
variable "app" {
  default = "s3-cognito-demo"
}

# 资源创建的 AWS 区域
variable "region" {
  default = "cn-north-1"
}

# 本地 AWS credentials profile，默认为default，您本地profile可能有多个
# 请主要不要将 AWS China Region 和 AWS Global Region 的 credentials 混淆
variable "profile" {
  default = "zhy"
}

# Provider domain, do NOT include https
variable "domain" {
  default = "aws-cognito.auth0.com"
}

# OIDC Client ID
variable "clientId" {
  default = "n4JmCUjAA4P7cEIEC3KI9yy8Kt4COqOt"
}

# 在 IAM Identity Providers 中创建的 OpenID Connect Provider 的 ARN
variable "openid_provider_arn" {
  default = "arn:aws-cn:iam::057005827724:oidc-provider/aws-cognito.auth0.com"
}
