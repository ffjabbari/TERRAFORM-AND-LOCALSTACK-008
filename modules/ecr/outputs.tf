output "ecr_repository_urls" {
  value       = { for r in aws_ecr_repository.ecr : r.name => r.repository_url }
  description = "The URL of the ECR repositories"
}
