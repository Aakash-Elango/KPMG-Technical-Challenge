## Variables
region = "us-east-1"
default_tags = {
    Application = "3-Tier"
    Environment  = "Dev"
  }

## VPC
vpc_cidr_block   = "10.0.0.0/16"
instance_tenancy = "default"

## Subnet
subnet_availability_zone = ["us-east-1a", "us-east-1b"]
subnet_cidr_block = ["10.0.1.0/24", "10.0.2.0/24"]

## ALB
alb_name = "alb-test"
alb_sg_name = "alb-sg-test"
alb_sg_description = "sg for alb"
alb_ingress_cidrs = ["80,80,tcp,0.0.0.0/0"]

## EC2
ec2_sg_name = "ec2-sg-test"
ec2_sg_description = "sg for ec2"
ec2_ingress_cidrs = ["80,80,tcp,0.0.0.0/0", "22,22,tcp,0.0.0.0/0", "3306,3306,tcp,0.0.0.0/0"]

## RDS
rds_sg_name = "rds-sg-test"
rds_sg_description = "sg for rds"
rds_ingress_cidrs = ["3306,3306,tcp,0.0.0.0/0"]