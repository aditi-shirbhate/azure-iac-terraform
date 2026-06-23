terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
}

module "network" {
  source = "./modules/network"

  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnet_name         = var.subnet_name
  subnet_prefixes     = var.subnet_prefixes
  nsg_name            = var.nsg_name
}

module "aks" {
  source = "./modules/aks"

  cluster_name        = var.cluster_name
  location            = var.location
  resource_group_name = module.network.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version
  node_count          = var.node_count
  vm_size             = var.vm_size
  subnet_id           = module.network.subnet_id
  environment         = var.environment
}
