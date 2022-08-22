# 1. Create VPC

resource "aws_vpc" "durian-vpc" {
  cidr_block       = "${var.vpc-cidr}"
  enable_dns_hostnames = true
  instance_tenancy = "default"

  tags = merge(local.common_tags, {
  Name = "Durianpay_vpc"
  })
}

# 2. Create Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.durian-vpc.id

  tags = merge(local.common_tags, {
  Name = "Durianpay_IGW"
  })
}

# 3 Create Elastic IP for NatGateway

resource "aws_eip" "eip" {
  vpc      = true

  tags = merge(local.common_tags, {
  Name = "Durianpay_NatgatewayEIP"
  })
}


# 4. Create NAT Gateway 

resource "aws_nat_gateway" "NatGateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public-ap-south-1a.id

  tags = merge(local.common_tags, {
  Name = "Durianpay_Natgateway"
  })
}
