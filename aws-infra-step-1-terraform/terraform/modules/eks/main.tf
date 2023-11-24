data "aws_ssm_parameter" "eks_ami_release_version" {
  name = "/aws/service/eks/optimized-ami/${aws_eks_cluster.eks_cluster.version}/amazon-linux-2/recommended/release_version"
}

data "aws_eks_cluster" "cluster" {
  name = aws_eks_cluster.eks_cluster.name
}

data "aws_eks_cluster_auth" "cluster" {
  name = aws_eks_cluster.eks_cluster.name
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.environment}-eks-cluster"
  role_arn = var.eks_cluster_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids

  }

depends_on = [aws_cloudwatch_log_group.logging]

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  encryption_config {
    provider {
      key_arn = var.eks_encryption_key_arn
    }
    resources = ["secrets"]
  }

}

resource "aws_cloudwatch_log_group" "logging" {
  name              = "${var.environment}-eks-cluster"
  retention_in_days = 1
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.environment}-eks-node-group"
  node_role_arn   = var.eks_node_role_arn
  subnet_ids      = var.subnet_ids
  version         = aws_eks_cluster.eks_cluster.version
  release_version = nonsensitive(data.aws_ssm_parameter.eks_ami_release_version.value)


  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }

  instance_types = ["t3.small"]

  update_config {
    max_unavailable = 1
  }


}

resource "aws_eks_addon" "aws-ebs-csi-driver" {
  
  cluster_name      = aws_eks_cluster.eks_cluster.name
  addon_name        = "aws-ebs-csi-driver"
  resolve_conflicts_on_create = "OVERWRITE"
  preserve          = true

  tags = {
    "eks_addon" = "aws-ebs-csi-driver"
  }
}

resource "aws_eks_addon" "aws-core-dns" {
  
  cluster_name      = aws_eks_cluster.eks_cluster.name
  addon_name        = "coredns"
  resolve_conflicts_on_create = "OVERWRITE"
  preserve          = true

  tags = {
    "eks_addon" = "coredns"
  }
}


resource "kubernetes_namespace" "awx-eks" {
  metadata {
    annotations = {
      name = "awx-eks"
    }

    labels = {
      eks = "true"
    }

    name = "awx-eks"
  }
}

resource "kubernetes_secret" "secret-admin-password" {
  metadata {
    name = "secret-admin-password"
    namespace = "awx-eks"
  }

  data = {
    password = base64encode(var.awx-eks-secret)
  }
}

resource "aws_eks_addon" "cloudwatch" {
  
  cluster_name      = aws_eks_cluster.eks_cluster.name
  addon_name        = "amazon-cloudwatch-observability"
  resolve_conflicts_on_create = "OVERWRITE"
  preserve          = true
  addon_version     = "v1.1.1-eksbuild.1"

  tags = {
    "eks_addon" = "cloudwatch"
  }
}