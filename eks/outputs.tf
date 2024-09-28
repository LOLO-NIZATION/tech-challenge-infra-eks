output "eks_cluster_endpoint" {
  description = "O endpoint do cluster EKS"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_arn" {
  description = "O ARN do cluster EKS"
  value       = module.eks.cluster_arn
}

output "eks_cluster_version" {
  description = "A versão do Kubernetes no cluster EKS"
  value       = module.eks.cluster_version
}
