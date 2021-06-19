## EC2

/*resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  availability_zone = var.ec2_availability_zone
  key_name = var.key_name
  subnet_id = var.ec2_subnet_id
  user_data = var.user_data
  vpc_security_group_ids = var.vpc_security_group_ids 
  root_block_device {
    volume_size = var.ec2_volume_size
    volume_type = var.ec2_volume_type
    delete_on_termination = true
  }
  tags = {
    Name = "HelloWorld"
  }
}

variable "ec2_ami" {
  type        = string
  description = "AMI to use for the instance"
}

variable "ec2_instance " {
  type        = string
  description = "AMI to use for the instance"
}*/

resource "aws_security_group" "allow_tls" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.sg_vpc_id
  tags = var.default_tags
}

resource "aws_security_group_rule" "ingress_rule" {
  count             = length(var.ingress_cidrs)
  type              = "ingress"
  security_group_id = aws_security_group.allow_tls.id
  from_port         = split(",", var.ingress_cidrs[count.index])[0]
  to_port           = split(",", var.ingress_cidrs[count.index])[1]
  protocol          = split(",", var.ingress_cidrs[count.index])[2]
  cidr_blocks       = [split(",", var.ingress_cidrs[count.index])[3]]
}
