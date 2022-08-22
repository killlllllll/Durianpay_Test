# Security group for ASG

resource "aws_security_group" "durianpay_asg_sg" {
  name        = "Durianpay-ASG-SG"
  description = "Allow SSH into EC2"
  vpc_id      = aws_vpc.durian-vpc.id

  ingress {
    description      = "Allow SSH into Ec2 instance"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
  Name = "Durianpay-ASG-SG"
  })
}