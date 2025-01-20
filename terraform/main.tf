terraform {
  required_version = ">= 1.2.0"
}

# 1️⃣ Networking must be created first
module "networking" {
  source = "./modules/networking"
}

# 2️⃣ IAM Role must exist before EKS can use it
module "iam" {
  source = "./modules/iam"
}

# 3️⃣ EKS Cluster (Must use IAM Role & Networking)
module "eks" {
  source       = "./modules/eks"
  cluster_name = var.cluster_name
  iam_role_arn = module.iam.cluster_role_arn  # Use cluster role
  vpc_id       = module.networking.vpc_id
  subnet_ids   = module.networking.subnet_ids
}

# 4️⃣ EKS Node Group (Must use EKS Cluster & Networking)
module "nodegroup" {
  source            = "./modules/nodegroup"
  cluster_name      = module.eks.cluster_name
  subnet_ids        = module.networking.subnet_ids
  iam_role_arn      = module.iam.node_role_arn  # Use node role
  cluster_depends_on = [module.eks.cluster_id]  # Pass cluster ID as dependency
}
