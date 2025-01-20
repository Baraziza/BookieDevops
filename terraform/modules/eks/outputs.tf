output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.name
}

output "cluster_id" {
  value = aws_eks_cluster.eks_cluster.id
}

output "subnet_ids" {
  value = aws_eks_cluster.eks_cluster.vpc_config[0].subnet_ids
}
