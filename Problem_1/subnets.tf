# 1. Create Public Subnet in ap-south-1a

resource "aws_subnet" "public-ap-south-1a" {
  vpc_id     = aws_vpc.durian-vpc.id
  cidr_block = "${var.public_subnet}"
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
  Name = "public-ap-south-1a"
  })
}

# 2. Create Private subnet in ap-south-1a

resource "aws_subnet" "private-ap-south-1a" {
  vpc_id     = aws_vpc.durian-vpc.id
  cidr_block = "${var.private_subnet}"
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false

  tags = merge(local.common_tags, {
  Name = "private-ap-south-1a"
  })
}

