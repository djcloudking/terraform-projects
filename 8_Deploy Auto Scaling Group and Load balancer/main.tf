# Declare the provider
provider "aws" {
  region = "us-east-1"
  }

# Declare the AZ
data "aws_availability_zones" "available" {
  state = "available"
}

# Declare VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.77.0"

  name = "main-vpc"
  cidr = "10.0.0.0/16"

  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}

# Declare AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]  # This might not be necessary anymore

  filter {
    name   = "name"
    values = ["ami-0ebfd941bbafe70c6"]  # Specific Amazon Linux 2 pattern
  }
}

# Declare Launch Configuration before ASG
resource "aws_launch_configuration" "djtuto" {
  name_prefix     = "aws-asg-"
  image_id        = data.aws_ami.amazon_linux.id  # Now references the declared resource
  instance_type   = "t2.micro"
}

# Declare autoscaling group
resource "aws_autoscaling_group" "djtuto" {
  name                 = "djtuto"
  min_size             = 1
  max_size             = 3
  desired_capacity     = 1
  launch_configuration = aws_launch_configuration.djtuto.name
  vpc_zone_identifier  = module.vpc.public_subnets

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

# Declare load balancer
resource "aws_lb" "djtuto" {
  name               = "learn-asg-tuto-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.djtuto_lb.id]
  subnets            = module.vpc.public_subnets
}

# Declare Load balancer listener
resource "aws_lb_listener" "djtuto" {
  load_balancer_arn = aws_lb.djtuto.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terratutorial.arn
  }
}

# Declare target group
resource "aws_lb_target_group" "djtuto" {
  name     = "learn-asg-djtuto"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

# Declare autoscaling attachment
resource "aws_autoscaling_attachment" "djtuto" {
  autoscaling_group_name = aws_autoscaling_group.djtuto.id
  lb_target_group_arn   = aws_lb_target_group.djtuto.arn
}

# Declare security group for EC2
resource "aws_security_group" "djtuto_instance" {
  name = "learn-asg-terratutorial-instance"
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.djtuto_lb.id]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  vpc_id = module.vpc.vpc_id
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

  vpc_id = module.vpc.vpc_id
}