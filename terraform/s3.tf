resource "aws_s3_bucket" "s3" {
  bucket = "user-content-${random_string.suffix.result}"
  region = "${var.region}"
  cors_rule {
    allowed_methods = ["PUT", "POST", "GET", "DELETE", "HEAD"]
    allowed_headers = ["*"]
    allowed_origins = ["*"]
  }
}
