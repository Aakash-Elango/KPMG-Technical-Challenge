## variables

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
