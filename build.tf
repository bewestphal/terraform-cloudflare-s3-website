resource "null_resource" "build-frontend" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    when        = create
    command     = "npm run build"
    interpreter = ["/bin/bash", "-c"]
    working_dir = "./client"
  }
}

resource "null_resource" "upload_to_s3" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command     = "aws s3 cp --recursive ./build/ s3://${aws_s3_bucket.static_site_bucket.bucket}"
    working_dir = "./client"
  }
  depends_on = [null_resource.build-frontend]
}
