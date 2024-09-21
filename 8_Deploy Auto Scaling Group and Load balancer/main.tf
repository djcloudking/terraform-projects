# Declare the provider
provider "aws" {
  region = "us-east-1"
  }

# Declare the AZ
data "aws_availability_zones" "available" {
  state = "available"
}

# Declare VPC
resource "aws_vpc" "dj_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "dj_vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.dj_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "pain" {
  vpc_id     = aws_vpc.dj_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Pain"
  }
}

# Declare EC2
resource "aws_instance" "test" {
  ami           = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"

    tags = {
    Name = "DjEctwo"
  }
}

# Declare Launch Configuration before ASG
resource "aws_launch_configuration" "djtuto" {
  name_prefix     = "aws-asg-"
  image_id        = aws_instance.test.ami  
  instance_type   = "t2.micro"
}

# Declare autoscaling group
resource "aws_autoscaling_group" "djtuto" {
  name                 = "djtuto"
  min_size             = 1
  max_size             = 3
  desired_capacity     = 1
  launch_configuration = aws_launch_configuration.djtuto.name
  vpc_zone_identifier  = [aws_subnet.main.id] 

  health_check_type    = "ELB"

  tag {
    key                 = "Name"
    value               = "Deploy ASG - tuto"
    propagate_at_launch = true
  }
}

# Declare autoscaling policy
resource "aws_autoscaling_policy" "scale_down" {
  name                   = "djtuto-scale-down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 120
  autoscaling_group_name = aws_autoscaling_group.djtuto.name
}

# Declare cloudwatch metric
resource "aws_cloudwatch_metric_alarm" "scale_down" {
  alarm_name          = "djtuto-scale-down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"                          # 2 minutes
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "10"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.djtuto.name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.scale_down.arn]
}

# Declare security group for Load balancer
resource "aws_security_group" "djtuto_lb" {
  name = "learn-asg-djtuto-lb"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = aws_vpc.dj_vpc.id 
}

# Declare load balancer
resource "aws_lb" "djtuto" {
  name               = "learn-asg-tuto-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.djtuto_lb.id]
  subnets            = [aws_subnet.main.id, aws_subnet.pain.id]
}