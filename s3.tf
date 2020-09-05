provider "aws" {
  profile    = "default"
  region     = data.external.env.result.AWS_REGION
  access_key = data.external.env.result.AWS_ACCESS_KEY
  secret_key = data.external.env.result.AWS_SECRET_KEY
}

resource "aws_s3_bucket" "static_site_bucket" {
  bucket = data.external.env.result.DOMAIN
  acl    = "public-read"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${data.external.env.result.DOMAIN}/*"
            ]
        }
    ]
}
EOF
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}
