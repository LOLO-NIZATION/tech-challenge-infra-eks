variable "aws_region" {
  description = "A região AWS onde o cluster será criado"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
  default     = "eks-cluster"
}

variable "desired_capacity" {
  description = "Capacidade desejada para os nós do EKS"
  type        = number
  default     = 2
}

variable "instance_type" {
  description = "Tipo de instância para os nós do EKS"
  type        = string
  default     = "t3.medium"
}
