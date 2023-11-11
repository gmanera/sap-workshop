# Gabriel Manera's AWS EKS Workshop Project

## Overview
This project sets up an Amazon EKS (Elastic Kubernetes Service) cluster for hosting Ansible and AWX. The focus is on best security practices, efficiency, and scalability. The setup includes an EKS cluster, worker nodes in an Auto Scaling group, and security configurations, all managed via AWS CloudFormation. Ansible and AWX are deployed using Helm.

## Components
- **Amazon EKS Cluster**: Managed Kubernetes service for running Kubernetes.
- **Worker Nodes**: EC2 instances in an Auto Scaling group registered with the EKS cluster.
- **Security Group**: Custom security group for EKS worker nodes.
- **IAM Roles**: IAM roles for the EKS cluster and worker nodes with least privilege access.
- **AWS KMS**: Integration with AWS KMS for encrypting Kubernetes secrets.
- **Ansible and AWX**: Deployment using Helm on the EKS cluster.

## Infrastructure Setup

### Prerequisites
- AWS CLI installed and configured.
- AWS CloudFormation.
- Helm installed for Kubernetes package management.
- An AWS account with necessary permissions.

### Creating the EKS Cluster
Set up the EKS cluster using AWS CloudFormation, which establishes the control plane, security groups, and IAM roles.

**Template**: `eks-cluster.yaml`

### Adding Worker Nodes
Deploy worker nodes using AWS CloudFormation. This includes setting up an Auto Scaling group.

**Instance Type**: `t3.micro` (Free tier eligible)  
**Count**: 2 nodes

**Template**: `eks-worker-nodes.yaml`

### Security Configurations
- **Node Security Group**: Defines rules for traffic to the worker nodes.
- **IAM Roles and Policies**: Specific permissions for the EKS cluster and worker nodes.
- **Encryption with AWS KMS**: Encrypt Kubernetes secrets using a specified AWS KMS key.