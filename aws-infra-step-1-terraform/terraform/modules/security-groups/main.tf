resource "aws_security_group" "eks_vpc_endpoint_guardduty" {
  name_prefix = "${var.environment}-vpc-endpoint-guardduty-sg-"
  description = "Security Group used by VPC Endpoints."
  vpc_id      = aws_vpc.vpc.id

  tags = {
    "Name"             = "${var.environment}-vpc-endpoint-guardduty-sg"
    "GuardDutyManaged" = "false"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "eks_vpc_guardduty_ingress" {
  security_group_id = aws_security_group.eks_vpc_endpoint_guardduty.id
  description       = "Ingress for port 443."
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_vpc_endpoint" "eks_vpc_guardduty" {
  vpc_id             = aws_vpc.vpc.id
  service_name       = data.aws_vpc_endpoint_service.guardduty.service_name
  vpc_endpoint_type  = "Interface"
  policy             = data.aws_iam_policy_document.eks_vpc_guardduty.json
  security_group_ids = [aws_security_group.eks_vpc_endpoint_guardduty.id]
  subnet_ids         = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]
  private_dns_enabled = true
}
