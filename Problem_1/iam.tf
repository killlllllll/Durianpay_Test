
resource "aws_iam_role" "ec2_role" {
  name               = "${var.company}-ec2-role"
  assume_role_policy = "${file("assume_role.json")}"
  tags               = merge(local.common_tags, {
  Name               = "${var.company}-ec2-role"
  })
}

resource "aws_iam_policy" "policy" {
  name        = "${var.company}-ec2-policy"
  description = "A ec2 server policy"
  policy      = "${file("cloudwatch_iam.json")}"
  tags        = merge(local.common_tags, {
  Name        = "${var.company}-ec2-policy"
  })
}


resource "aws_iam_policy_attachment" "ec2_profile-attach" {
  name       = "ec2_profile-attachment"
  roles      = ["${aws_iam_role.ec2_role.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name  = "${var.company}-ec2-profile"
  role  = "${aws_iam_role.ec2_role.name}"
  tags  = merge(local.common_tags, {
  Name  = "${var.company}-ec2-profile"
  })
}