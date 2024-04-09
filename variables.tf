# VPC

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public subnets"
  type        = list(string)
}

# ECR

variable "ecr_names" {
  description = "List of ECR names"
  type        = list(string)
}

# EKS

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

#DB

variable "db_cluster_name" {
  description = "Name of the RDS cluster"
  type        = string
}

variable "db_instance_name" {
  description = "Name of DB Instance"
  type        = string
}

variable "db_username" {
  description = "Username for the database"
  type        = string
}

variable "db_password" {
  description = "Password for the database"
  type        = string
}
