# S3, Cognito, OpenID Connect Demo

本文介绍如何使用Cognito Identity Pool 对接 OpenID Connect, 实现用户只能上传和查看自己的文件。

## 前提

1. 本文将使用Auth0 作为用户库，请去 https://auth0.com 注册一个帐号，并添加 **application**， 
请注册Auth0账户，或者任何符合 **OpenID Connect** 规范的用户库
2. 本文使用 **terraform** 一键部署AWS 资源，请在本机安装terraform, 并配置好AWS Credentials
3. 前端包管理使用 **yarn**, 请自行安装 **yarn**.

## 部署

Step 1: 在 [IAM Identity Provider](https://console.amazonaws.cn/iam/home#/providers) 中对接**Auth0**中创建Application.

Step 2: 在 **terraform/variables.tf** 中修改参数的值

Step 3: 部署 Cognito及相关IAM Role, `terraform init` & `terrafrom apply`

Step 4: 安装 Web 依赖, `yarn install`

Step 5: 运行前端程序 `yarn start`

Step 6: 程序正常运行，登录后，选择文件，并上传.

## 参考资料

[OpenID](https://docs.aws.amazon.com/cognito/latest/developerguide/open-id.html)
[Auth0 配置](https://auth0.com/docs/integrations/integrating-auth0-amazon-cognito-mobile-apps)
[JS S3 上传示例代码](https://docs.aws.amazon.com/cognito/latest/developerguide/getting-credentials.html#getting-credentials-1.javascript
)
