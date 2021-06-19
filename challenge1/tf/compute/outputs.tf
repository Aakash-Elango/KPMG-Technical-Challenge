## outputs

output "lb_config" {
  value = aws_lb.test
}

output "tg_config" {
  value = aws_lb_target_group.tg
}

output "lb_listener_config" {
  value = aws_lb_listener.front_end
}

output "asg_config" {
  value = aws_autoscaling_group.bar
}

output "lt_config" {
  value = aws_launch_template.lt
}

output "rds_config" {
  value = aws_db_instance.rds
}