variable "env_name" {}

variable "label" {default = "hairy_bikers"}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-${var.env_name}-bucket"

  tags = {
    Name        = "My ${var.env_name} bucket"
    Environment = "${var.env_name}"
    Labels      = "${var.label}"
  }
}

