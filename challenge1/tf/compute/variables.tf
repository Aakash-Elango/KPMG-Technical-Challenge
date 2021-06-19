variable "alb_name" {
  type = string
  description = "Name of the ALB"
}

variable "alb_security_groups" {
  type = list(string)
  description = "ALB SG"
}

variable "alb_subnet" {
  type = list(string)
  description = "ALB subnet"
}

variable "default_tags" {
  type = map(string)
  description = "Tags for ALB"
}

variable "tg_vpc_id" {
  type = string
  description = "VPC id for tg"
}

variable "asg_subnet_ids" {
    type   = list(string)
    description = "list of asg subnets"
}

variable "ec2_security_groups" {
  type = list(string)
  description = "sg for ec2"
}

variable "db_username" {
  type = string
  description = "username for rds"
}

variable "db_password" {
  type = string
  description = "password for rds"
}

variable "db_subnet_group_name" {
  type = list(string)
  description = "subnet for rds"
}

variable "rds_security_groups" {
  type = list(string)
  description = "sg for rds"
}