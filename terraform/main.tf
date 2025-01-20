terraform {
  required_version = ">= 1.2.0"
}


module "networking" {
  source = "./modules/networking"
}

module "eks" {
  source       = "./modules/eks"
  cluster_name = "telemachus-eks"
  iam_role_arn = module.iam.cluster_role_arn
  vpc_id       = module.networking.vpc_id
  subnet_ids   = module.networking.subnet_ids
}

module "iam" {
  source = "./modules/iam"
}

module "nodegroup" {
  source       = "./modules/nodegroup"
  cluster_name = module.eks.cluster_name
  subnet_ids   = module.networking.subnet_ids
  iam_role_arn = module.iam.node_role_arn
}