provider "aws" {
  region = "ap-southeast-1"
  profile = "admin"
}

terraform {
  backend "s3" {
    bucket = "ecommerce-web01-tf-state"
    key    = "tf.dev"
    region = "ap-southeast-1"
    profile = "admin"
  }
}