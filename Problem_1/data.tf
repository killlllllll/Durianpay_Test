data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["amazon"] # Canonical
}

data "aws_availability_zones" "available" {}

data "aws_instances" "Durianpay_instance" {

  instance_tags = {
    "aws:autoscaling:groupName"   = "Durianpay_ASG"
  }

  instance_state_names = ["running", "stopped"]

}

output ids {

    value = data.aws_instances.Durianpay_instance.ids

}