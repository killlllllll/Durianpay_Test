 # To store state file in S3 backend
 
 terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "terraform-narshing-s3-backend"
    key            = "terraform.tfstate"
    region         = var.aws_region
    dynamodb_table = "terraform-narshing-s3-backend-table"
  }
} 