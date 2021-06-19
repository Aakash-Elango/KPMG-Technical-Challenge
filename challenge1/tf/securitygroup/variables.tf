variable "sg_name" {
  type = string
  description = "Allow TLS inbound traffic"
}

variable "sg_description" {
  type = string
  description = "Allow TLS inbound traffic"
}

variable "sg_vpc_id" {
  type = string
  description = "VPC id"
}

variable "default_tags" {
  type = map(string)
  description = "Tags for SG"
}

variable "ingress_cidrs" {
  type = list(string)
  description = "Inbound rules"
  default = []
}