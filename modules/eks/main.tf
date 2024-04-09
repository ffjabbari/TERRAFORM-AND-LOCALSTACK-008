module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  enable_irsa = var.enable_irsa

  eks_managed_node_group_defaults = var.eks_managed_node_group_defaults
}
