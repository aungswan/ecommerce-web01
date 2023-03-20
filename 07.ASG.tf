resource "aws_launch_template" "webserver_launch_template" {
  name          = var.launch_template_name
  image_id      = var.ec2_image_id
  instance_type = var.ec2_instance_type
  key_name      = var.ec2_ssh_key
  description   = "Template ASG"
  
  iam_instance_profile {
    name = aws_iam_instance_profile.ec2-profile.name
  }

  monitoring {
    enabled = false
  }

  vpc_security_group_ids = [aws_security_group.webserver_security_group.id]
}

resource "aws_autoscaling_group" "auto_scaling_group" {
  vpc_zone_identifier = [aws_subnet.private_app_subnet_az1.id,aws_subnet.private_app_subnet_az2.id]
  desired_capacity    = 2
  max_size            = 2
  min_size            = 1
  name                = "web01-asg"
  health_check_type   = "ELB"

  launch_template {
    name    = aws_launch_template.webserver_launch_template.name
    version = "$Latest"
  }
  
  #role_arn = arn:aws:iam::181147970314:role/SSMEC2
  
  tag {
    key                 = "Name"
    value               = "web01-asg"
    propagate_at_launch = true
  }
  
  lifecycle {

    ignore_changes      = [target_group_arns]
  }
}

resource "aws_autoscaling_schedule" "reducing" {
  scheduled_action_name  = "reducing"
  min_size               = 0
  max_size               = 1
  desired_capacity       = 0
  recurrence             = "30 18 * * *"
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group.name
}

resource "aws_autoscaling_attachment" "asg_alb_target_group_attachment" {
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group.id
  lb_target_group_arn    = aws_lb_target_group.alb_target_group.arn
}

resource "aws_autoscaling_notification" "webserver_asg_notifications" {
  group_names = [aws_autoscaling_group.auto_scaling_group.name]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.user_updates.arn
}