output "cluster_id" {
  value = aws_eks_cluster.eks_cluster.id
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_auth_token" {
  value = data.aws_eks_cluster_auth.cluster.token
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "secret_admin_password" {
  value = kubernetes_secret.secret-admin-password.data.password
  description = "AWX Admin Secret"
}

output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}
