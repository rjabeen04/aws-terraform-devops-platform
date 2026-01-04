variable "project" {
  type = string
}

variable "bucket_name" {
  type = string
  description = "Unique S3 bucket name for the frontend site."
}

variable "price_class" {
  type    = string
  default = "PriceClass_100"
}

