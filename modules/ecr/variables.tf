variable "ecr_names" {
  description = "List of ECR names"
  type        = list(string)
}

variable "eks_cluster_iam_role_arns" {
  description = "ARNs of the IAM roles for the EKS cluster"
  type        = list(string)
  default     = []
}
