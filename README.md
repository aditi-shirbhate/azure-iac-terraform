# Azure IaC with Terraform 🚀

Provisioning a production-ready AKS cluster with VNet and NSG on Azure using modular Terraform.

## Architecture
## What This Provisions

- **Resource Group** — scoped per environment
- **Virtual Network + Subnet** — custom CIDR address space
- **Network Security Group** — with HTTPS inbound rule
- **AKS Cluster** — with SystemAssigned managed identity, Azure CNI networking, and configurable node pool

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.3.0
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) installed and logged in
- An active Azure subscription

## Usage

```bash
# Clone the repo
git clone https://github.com/aditi-shirbhate/azure-iac-terraform.git
cd azure-iac-terraform

# Copy and update variables
cp terraform.tfvars.example terraform.tfvars

# Login to Azure
az login

# Initialize Terraform
terraform init

# Preview changes
terraform plan

# Apply
terraform apply
```

## Variables

| Name | Description | Default |
|------|-------------|---------|
| `resource_group_name` | Name of the resource group | `rg-aks-demo` |
| `location` | Azure region | `East US` |
| `cluster_name` | AKS cluster name | `aks-demo-cluster` |
| `node_count` | Number of nodes | `2` |
| `vm_size` | Node VM size | `Standard_D2s_v3` |
| `kubernetes_version` | Kubernetes version | `1.28.0` |
| `environment` | Environment name | `dev` |

## Tech Stack

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=flat&logo=terraform)
![Azure](https://img.shields.io/badge/Azure-0078D4?style=flat&logo=microsoftazure)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=flat&logo=kubernetes)
