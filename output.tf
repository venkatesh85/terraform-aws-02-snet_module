# -----------subnet_modules outputs.tf----------------
output "public_subnet_ids" {
  description = "The IDs of the public subnets."
  value       = aws_subnet.public_subnet.*.id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets."
  value       = aws_subnet.private_subnet.*.id
}

output "full_private_subnet_ids" {
  description = "The IDs of the full private subnets."
  value       = aws_subnet.private_full_subnet.*.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  value       = aws_nat_gateway.nat.id
}