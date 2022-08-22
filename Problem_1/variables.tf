variable "vpc-cidr" {
description = "VPC CIDR BLOCK"
type = string
}
variable "aws_region" {
  description = "aws region"
  type = string
}

variable "public_subnet" {
description = "Public_Subnet_1a"
type = string
}

variable "private_subnet" {
description = "Private_Subnet_1a"
type = string
}

variable "company" {
description = "company_name"
type = string
}

variable "owner" {
description = "owner_name"
type = string
}

variable "created_by" {
description = "name of the person who created code"
type = string
}


variable "key_name" {
description = "Name of keypair to ssh"
type = string
}

variable "instance_type" {
type        = string
default     = ""
}