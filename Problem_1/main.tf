
##################################################################################
# TERRAFORM CONFIG
##################################################################################

terraform {
required_version = ">= 0.13"
 required_providers {
 aws = {
 source = "hashicorp/aws"
 version = "~> 4.0"
 }
 random = {
 source = "hashicorp/random"
version = "~> 3.0"
}
 

 }
}

##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
 region = var.aws_region
}


