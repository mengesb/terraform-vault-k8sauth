#
# Terraform:: terraform-vault-k8sauth
# Plan:: outputs.tf
#

output "namespace" {
  sensitive   = false
  value       = kubernetes_namespace.vault_namespace.metadata[0].name
  description = "Name of the Kubernetes namespace that was created."
}

output "accessor" {
  sensitive   = false
  value       = vault_auth_backend.backend.accessor
  description = "Vault mount accessor"
}

output "path" {
  sensitive   = false
  value       = vault_auth_backend.backend.path
  description = "Vault mount path"
}
