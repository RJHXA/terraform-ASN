resource "aws_launch_template" "asg_launch_template" {
  name_prefix   = "asg-template-"
  image_id      = var.ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.ec2_public_sg_id]
  user_data     = base64encode(file("${path.module}/user_data.sh"))

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "ASG-Instance"
      project = "rjhxa_gsg"
    }
  }
}

resource "aws_lb" "asg_lb" {
  name               = "asg-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_alb_id]
  subnets            = [var.public_1_subnet_id, var.public_2_subnet_id]

  tags = {
    Name    = "ASG-Load-Balancer"
    project = "rjhxa_gsg"
  }
}

resource "aws_lb_listener" "asg_listener" {
  load_balancer_arn = aws_lb.asg_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg_target_group.arn
  }
}

resource "aws_lb_target_group" "asg_target_group" {
  name     = "asg-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    project = "rjhxa_gsg"
  }
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity     = 1
  min_size            = 1
  max_size            = 2
  vpc_zone_identifier = [
    var.public_1_subnet_id,
    var.public_2_subnet_id
  ]
  target_group_arns   = [aws_lb_target_group.asg_target_group.arn]

  launch_template {
    id      = aws_launch_template.asg_launch_template.id
    version = "$Latest"
  }

  tag {
    key                 = "project"
    value               = "rjhxa_gsg"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale-up-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.asg.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale-down-policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.asg.name
}
