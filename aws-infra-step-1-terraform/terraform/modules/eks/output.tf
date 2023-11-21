output "cluster_id" {
  value = aws_eks_cluster.eks_cluster.id
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "ebs_volume_id" {
  value = aws_ebs_volume.pv-awx-eks.id
}

output "secret_admin_password" {
  value = kubernetes_secret.secret-admin-password.data.password
  description = "AWX Admin Secret"
}
