variable "region_default" {
  default = "us-east-1"
}

variable "project_name" {
  default = "FIAP"
}

variable "lab_role" {
  default = "arn:aws:iam::060254399214:role/LabRole"
}

variable "access_config" {
  default = "API_AND_CONFIG_MAP"
}

variable "node_group" {
  default = "fiap"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "principal_arn" {
  default = "arn:aws:iam::060254399214:role/voclabs"
}

variable "policy_arn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}