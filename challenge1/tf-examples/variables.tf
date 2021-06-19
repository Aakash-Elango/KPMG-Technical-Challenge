## variables

variable "region" {
    default     = "us-east-1"
    type        = string
    description = "The region were resource will be provisioned"  
}

variable "vpc_cidr_block" {
    type        = string
    description = "The CIDR block for the VPC"
}

variable "instance_tenancy" {
    type        = string
    description = "A tenancy option for instances launched into the VPC. Default is default,Using either of the other options (dedicated or host)"
}

variable "default_tags" {
    type        = map(string)
    description = "default tags applied to resource"
}

variable "subnet_availability_zone" {
    type = list(string)
    description = "The AZ for the subnet"
}

variable "subnet_cidr_block" {
    type = list(string)
    description = "The CIDR block for the subnet"
}

variable "alb_name" {
  type = string
  description = "Name of the ALB"
}

variable "alb_sg_name" {
  type = string
  description = "Allow TLS inbound traffic"
}

variable "alb_sg_description" {
  type = string
  description = "Allow TLS inbound traffic"
}

variable "alb_ingress_cidrs" {
  type = list(string)
  description = "Inbound rules"
  default = []
}

variable "ec2_sg_name" {
  type = string
  description = "Allow TLS inbound traffic"
}

variable "ec2_sg_description" {
  type = string
  description = "Allow TLS inbound traffic"
}

variable "ec2_ingress_cidrs" {
  type = list(string)
  description = "Inbound rules"
  default = []
}

variable "rds_sg_name" {
  type = string
  description = "Allow TLS inbound traffic"
}

variable "rds_sg_description" {
  type = string
  description = "Allow TLS inbound traffic"
}

variable "rds_ingress_cidrs" {
  type = list(string)
  description = "Inbound rules"
  default = []
}