resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = module.iam.cluster_role_arn

  vpc_config {
    subnet_ids = module.networking.subnet_ids
  }

  depends_on = [
    module.iam,
    module.networking
  ]
}