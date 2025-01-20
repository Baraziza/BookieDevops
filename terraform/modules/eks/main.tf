resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = var.iam_role_arn  # Correctly using IAM Role from module

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}
