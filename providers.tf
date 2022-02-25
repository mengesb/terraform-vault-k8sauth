#
# Terraform:: terraform-vault-k8sauth
# Plan:: provider.tf
#

terraform {
  required_version = "~> 1.0"

  required_providers {
    vault = {
      version = "~> 3.3"
      source  = "hashicorp/vault"
    }
    kubernetes = {
      version = "~> 2.8"
      source  = "hashicorp/kubernetes"
    }
  }
}
