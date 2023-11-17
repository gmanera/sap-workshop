variable "vpc_id" {
  description = "The VPC ID where the EKS Cluster will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS Cluster"
  type        = list(string)
}

variable "environment" {
  description = "Environment prefix for naming resources"
}

variable "eks_encryption_key_arn" {
  description = "ARN of the EKS encryption KMS key"
  type        = string
}

variable "eks_cluster_role_arn" {
  description = "ARN of the IAM role for the EKS cluster"
  type        = string
}

variable "eks_node_role_arn" {
  description = "ARN of the IAM role for the EKS Nodes"
  type        = string
}