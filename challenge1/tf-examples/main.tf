## provider

provider "aws" {
    region = var.region
}

## data secret

data "aws_secretsmanager_secret" "rds" {
  name = "rds"
}

data "aws_secretsmanager_secret_version" "rds" {
  secret_id = data.aws_secretsmanager_secret.rds.id
}

## Network

module "network" {
    source = "../tf/network"
    vpc_cidr_block       = var.vpc_cidr_block
    instance_tenancy = var.instance_tenancy
    subnet_availability_zone = var.subnet_availability_zone
    subnet_cidr_block = var.subnet_cidr_block
    default_tags = var.default_tags
}

## Compute

module "compute" {
    source = "../tf/compute"
    alb_name         = var.alb_name
    alb_security_groups    = [module.alb_security_group.security_group_config.id]
    alb_subnet   = [module.vpc.subnet1_config.id, module.vpc.subnet2_config.id]
    tg_vpc_id     = module.vpc.vpc_config.id
    asg_subnet_ids = [module.vpc.subnet1_config.id, module.vpc.subnet2_config.id]
    ec2_security_groups = [module.ec2_security_group.security_group_config.id]
    db_username       = jsondecode(data.aws_secretsmanager_secret_version.rds.secret_string)["username"]
    db_password       = jsondecode(data.aws_secretsmanager_secret_version.rds.secret_string)["password"]
    db_subnet_group_name = [module.vpc.subnet1_config.id, module.vpc.subnet2_config.id]
    rds_security_groups = [module.rds_security_group.security_group_config.id]
    default_tags = var.default_tags
}

## ALB Security Group

module "alb_security_group" {
    source = "../tf/securitygroup"
    sg_name = var.alb_sg_name
    sg_description = var.alb_sg_description 
    sg_vpc_id = module.vpc.vpc_config.id
    ingress_cidrs = var.alb_ingress_cidrs
    default_tags = var.default_tags
}

## EC2 Security Group

module "ec2_security_group" {
    source = "../tf/securitygroup"
    sg_name = var.ec2_sg_name
    sg_description = var.ec2_sg_description 
    sg_vpc_id = module.vpc.vpc_config.id
    ingress_cidrs = var.ec2_ingress_cidrs
    default_tags = var.default_tags
}

## RDS Security Group

module "rds_security_group" {
    source = "../tf/securitygroup"
    sg_name = var.rds_sg_name
    sg_description = var.rds_sg_description 
    sg_vpc_id = module.vpc.vpc_config.id
    ingress_cidrs = var.rds_ingress_cidrs
    default_tags = var.default_tags
}