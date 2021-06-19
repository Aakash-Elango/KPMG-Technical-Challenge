## outputs

output "vpc_id" {
  value = module.vpc.vpc_config.id
}

output "subnet1_id" {
  value = module.vpc.subnet1_config.id
}

output "subnet2_id" {
  value = module.vpc.subnet2_config.id
}

output "alb_sg_id" {
  value = module.alb_security_group.security_group_config.id
}

output "ec2_sg_id" {
  value = module.ec2_security_group.security_group_config.id
}

output "rds_sg_id" {
  value = module.ec2_security_group.security_group_config.id
}

output "alb_id" {
  value = module.compute.lb_config.id
}

output "tg_id" {
  value = module.compute.tg_config.id
}

output "lb_listener_id" {
  value = module.compute.lb_listener_config.id
}

output "asg_id" {
  value = module.compute.asg_config.id
}

output "lt_id" {
  value = module.compute.lt_config.id
}

output "rds_id" {
  value = module.compute.rds_config.id
}
