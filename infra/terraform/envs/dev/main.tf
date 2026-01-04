resource "aws_s3_bucket" "dev_smoke" {
  bucket = "dev-smoke-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 4
}

