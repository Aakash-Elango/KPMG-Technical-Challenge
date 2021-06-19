## Life Cycle Management

terraform {
  backend "s3" {
    bucket = "my-bucket-aakash-elangovan"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}