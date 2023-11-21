resource "helm_release" "awx-operator" {
  name       = "awx-operator"
  repository = "https://ansible.github.io/awx-operator/"
  chart      = "awx-operator"
  namespace   = "awx-eks"
  version     = "2.7.2"

  values = [
    file("${path.module}/awx.yaml")
  ]
}