# SAP Workshop: Secure and Scalable EKS Deployment with Ansible and AWX

## Overview
This workshop is designed for the Enterprise Cloud services security team at SAP, focusing on setting up a secure, efficient, and scalable Amazon EKS cluster for hosting Ansible and AWX. The deployment utilizes Terraform for infrastructure management, Helm for application deployment, and Ansible for automation orchestration.

## Objectives
- Deploy a secure and scalable Amazon EKS cluster.
- Utilize Terraform for efficient infrastructure management.
- Implement Ansible and AWX for automation within a Kubernetes environment.
- Apply best practices in cloud security, efficiency, and scalability.

## Prerequisites
- Basic knowledge of Kubernetes, AWS EKS, and AWS services.
- Familiarity with Terraform, Helm, and Ansible.

## Workshop Structure

### Step 1: AWS Infrastructure Setup with Terraform
- `aws-infra-step-1-terraform/`
  - Terraform scripts for setting up the EKS cluster, IAM roles, VPC, and security groups.
  - Key focus on security configurations like IAM roles, KMS for encryption, and VPC setup.

### Step 2: Deploying AWX with Helm
- `aws-awx-helm-step-2/helm-chart/`
  - Configuration and deployment of AWX using Helm charts.
  - Emphasis on best practices for Helm chart configurations.

### Step 3: Ansible Integration and Management
- `awx-ansible-step-3/`
  - **<span style="color:red;">No pre-created Ansible playbooks are provided, allowing the ECS team to decide on the development scope.</span>**

## Core Components
- **Amazon EKS**: Managed Kubernetes service for running containers.
- **Terraform**: Infrastructure as Code tool for resource management.
- **Helm**: Kubernetes package manager for deploying AWX.
- **Ansible & AWX**: Automation tools for configuration and orchestration.

## Best Practices and Key Concepts

### Security
- **IAM Roles and Policies**: Implement least privilege access control.
- **Encryption with AWS KMS**: Ensuring data security at rest.
- **Integration with AWS GuardDuty**: Enhanced security monitoring.

### Efficiency
- **Auto Scaling Groups**: For dynamic scaling of worker nodes.
- **Terraform State Management**: Ensuring consistent infrastructure deployment.
- **Resource Tagging**: For better management and cost allocation.

### Scalability
- **EKS Cluster Configuration**: Optimized for high availability and load balancing.
- **Persistent Volume Management**: Efficient storage solutions for Kubernetes.
- **Load Balancing Strategies**: Implementing AWS load balancers for traffic distribution.

### Monitoring & Logging
- **CloudWatch Integration**: For comprehensive monitoring and logging.
- **Prometheus and Grafana**: Custom monitoring solutions for Kubernetes clusters.
- **Elasticsearch, Fluentd, and Kibana (EFK Stack)**: For efficient log management.

## Hands-On Labs
Participants will work through labs covering:
1. Terraform script execution and AWS resource setup.
2. Helm chart customization and AWX deployment.
3. Ansible playbook creation and execution in the Kubernetes environment.

## Resources
- [AWS Documentation](https://aws.amazon.com/documentation/)
- [Terraform Guides](https://www.terraform.io/docs/index.html)
- [Helm Chart Repositories](https://artifacthub.io/)
- [Ansible Documentation](https://docs.ansible.com/)

## Contributing
Feedback and contributions to this workshop are encouraged. Please adhere to the [CONTRIBUTING.md](CONTRIBUTING.md) guidelines for contributions.

## License
This workshop and its content are licensed under the MIT License. Refer to the [LICENSE](LICENSE) file for details.