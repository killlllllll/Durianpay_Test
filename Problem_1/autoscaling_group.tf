resource "aws_launch_template" "template" {
  name                                 = "durianpay_ASG_template"
  ebs_optimized                        = true
  image_id                             = data.aws_ami.amazon_linux.id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = var.instance_type
  key_name                             = var.key_name
  user_data                            = "${filebase64("user_data.sh")}"
  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }
  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = aws_subnet.private-ap-south-1a.id
    security_groups            = [aws_security_group.durianpay_asg_sg.id]
    delete_on_termination       = true
  }
   tag_specifications {   
   resource_type = "instance"
   tags = merge(local.common_tags, {
   Name = "ASG-EC2"
  })
 }
}

resource "aws_autoscaling_group" "durianpay_ASG" {
  name                      = "Durianpay_ASG"
  health_check_type         = "EC2"
  health_check_grace_period = 300
  #termination_policies      = ["OldestInstance"]
  launch_template {
    id      = aws_launch_template.template.id
  }
  min_size = 2
  max_size = 5
 
}

resource "aws_autoscaling_policy" "durianpay_target_tracking_policy" {
name = "durianpay-asg-target-tracking-policy"
policy_type = "TargetTrackingScaling"
autoscaling_group_name = "${aws_autoscaling_group.durianpay_ASG.name}"
estimated_instance_warmup = 300

target_tracking_configuration {
predefined_metric_specification {
predefined_metric_type = "ASGAverageCPUUtilization"
}

    target_value = "45"
 }
}