resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = var.cluster_name
  node_role_arn   = var.iam_role_arn
  subnet_ids      = var.subnet_ids
  instance_types  = ["t3.small"]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  # Add required tags for the AWS cloud provider
  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }

  # Ensure cluster is ready before creating nodes
  depends_on = [
    var.cluster_depends_on
  ]
}
