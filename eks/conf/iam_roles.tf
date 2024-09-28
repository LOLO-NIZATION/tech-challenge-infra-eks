module "eks_iam" {
  source  = "terraform-aws-modules/iam/aws"
  name    = var.cluster_name
  trusted_entities = ["eks.amazonaws.com"]

  # Attach EKS policies
  attach_policies = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy", "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"]
}
