provider "aws" {
  region = var.aws_region
}

# Módulo para criar a VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"

  name = "eks-vpc"
  cidr = "10.0.0.0/16"

  azs             = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true

  tags = {
    Name = "eks-vpc"
  }
}

# Cluster EKS
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.23"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"
    }
  }

  tags = {
    Name = "eks-cluster"
  }
}

# Configuração do IAM para o EKS
module "eks_iam" {
  source  = "terraform-aws-modules/iam/aws"
  name    = var.cluster_name
  trusted_entities = ["eks.amazonaws.com"]

  # Política de permissões para o EKS
  attach_policies = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy", "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"]
}

# Saída do endpoint e do ARN do cluster
output "eks_cluster_endpoint" {
  description = "O endpoint do cluster EKS"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_arn" {
  description = "O ARN do cluster EKS"
  value       = module.eks.cluster_arn
}
