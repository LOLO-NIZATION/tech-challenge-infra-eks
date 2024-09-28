module "eks" {
  source = "terraform-aws-modules/eks/aws"

  node_groups = {
    eks_nodes = {
      desired_capacity = var.desired_capacity
      max_capacity     = 3
      min_capacity     = 1

      instance_type = var.instance_type
    }
  }
}
