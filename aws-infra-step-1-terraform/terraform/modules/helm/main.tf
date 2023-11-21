resource "helm_release" "awx-operator" {
  name       = "awx-operator"
  repository = "https://ansible.github.io/awx-operator/"
  chart      = "awx-operator"

  values = [
    file("${path.module}/awx.yaml")
  ]
}