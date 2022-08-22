# Create Public Route Table 

resource "aws_route_table" "durian-public-route-table" {
  vpc_id = aws_vpc.durian-vpc.id

  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(local.common_tags, {
  Name = "Durianpay_Public_Route_Table"
  })
}

# Create Private Route Table 

resource "aws_route_table" "durian-private-route-table" {
  vpc_id = aws_vpc.durian-vpc.id

  route {
     cidr_block = "0.0.0.0/0" 
     gateway_id = aws_nat_gateway.NatGateway.id
  }

  tags = merge(local.common_tags, {
  Name = "Durianpay_Private_Route_Table"
  })
}

# Associate public subnet with durian-public-route-table

resource "aws_route_table_association" "public_subnet_1a" {
  subnet_id      = aws_subnet.public-ap-south-1a.id
  route_table_id = aws_route_table.durian-public-route-table.id
}

# Associate private subnet with durian-private-route-table

resource "aws_route_table_association" "private_subnet_1a" {
  subnet_id      = aws_subnet.private-ap-south-1a.id
  route_table_id = aws_route_table.durian-private-route-table.id
}