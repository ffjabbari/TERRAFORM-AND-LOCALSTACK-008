output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "List of IDs of private subnets."
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets."
  value       = module.vpc.public_subnets
}

output "security_group" {
  description = "VPC Security Group ID"
  value       = module.vpc.default_security_group_id
}
