module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  environment         = var.environment
}

module "iam" {
  source = "./modules/iam"
  environment = var.environment
}

module "kms" {
  source = "./modules/kms"
  # other required variables for kms module
}

module "eks" {
  source      = "./modules/eks"
  eks_encryption_key_arn = module.kms.eks_encryption_key_arn
  eks_cluster_role_arn = module.iam.eks_cluster_role_arn
  eks_node_role_arn = module.iam.eks_node_role_arn
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = concat(module.vpc.public_subnet_ids, module.vpc.private_subnet_ids)
  environment = var.environment
}