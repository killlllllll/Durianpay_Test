# Cloudwatch Dashboard for CPU-Utilization

resource "aws_cloudwatch_dashboard" "dashboard" {
  dashboard_name = "Durianpay-Cpu-dashboard"

  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/EC2",
            "CPUUtilization",
            "InstanceId",
            "data.aws_instances.Durianpay_instance.id"
          ]
        ],
        "period": 300,
        "stat": "Average",
        "region": "us-east-1",
        "title": "EC2 Instance CPU"
      }
    },
    {
      "type": "text",
      "x": 0,
      "y": 7,
      "width": 3,
      "height": 3,
      "properties": {
        "markdown": "Hello world"
      }
    }
  ]
}
EOF
}

# Cloudwatch Dashboard for NetworkIN

resource "aws_cloudwatch_dashboard" "network_dashboard" {
  dashboard_name = "Durianpay-network-dashboard"

  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/EC2",
            "NetworkIN",
            "InstanceId",
            "data.aws_instances.Durianpay_instance.id"
          ]
        ],
        "period": 300,
        "stat": "Average",
        "region": "us-east-1",
        "title": "EC2 Network CPU"
      }
    },
    {
      "type": "text",
      "x": 0,
      "y": 7,
      "width": 3,
      "height": 3,
      "properties": {
        "markdown": "Hello world"
      }
    }
  ]
}
EOF
}


# Cloudwatch alarm for cpu utilization

resource "aws_cloudwatch_metric_alarm" "ec2_cpu" {

     alarm_name                = "cpu-utilization"
     comparison_operator       = "GreaterThanOrEqualToThreshold"
     evaluation_periods        = "2"
     metric_name               = "CPUUtilization"
     namespace                 = "AWS/EC2"
     period                    = "120" 
     statistic                 = "Average"
     threshold                 = "80"
     alarm_description         = "This metric monitors ec2 cpu utilization"
     insufficient_data_actions = []

dimensions = {
       InstanceId = data.aws_instances.Durianpay_instance.id
    }

}

# Cloudwatch alarm for status health check


resource "aws_cloudwatch_metric_alarm" "instance-health-check" {
  alarm_name                = "instance-health-check"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "StatusCheckFailed"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "1"
  alarm_description         = "This metric monitors ec2 health status"
dimensions = {
    InstanceId = data.aws_instances.Durianpay_instance.id
  }
}

# Cloudwatch alarm for Network usage 

resource "aws_cloudwatch_metric_alarm" "ec2_networkin" {

     alarm_name                = "networkIN"
     comparison_operator       = "GreaterThanOrEqualToThreshold"
     evaluation_periods        = "2"
     metric_name               = "NetworkIN"
     namespace                 = "AWS/EC2"
     period                    = "120" 
     statistic                 = "Average"
     threshold                 = "80"
     alarm_description         = "This metric monitors ec2 network utilization"
     insufficient_data_actions = []

dimensions = {
       InstanceId = data.aws_instances.Durianpay_instance.id
    }

}

