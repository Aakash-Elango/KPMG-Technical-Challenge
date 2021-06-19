## outputs

output "vpc_config" {
  value = aws_vpc.vpc
}

output "subnet1_config" {
  value = aws_subnet.subnets[0]
}

output "subnet2_config" {
  value = aws_subnet.subnets[1]
}