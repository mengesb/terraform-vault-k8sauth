#
# Terraform:: terraform-vault-k8sauth
# Plan:: variables.tf
#

variable "namespace" {
  sensitive   = false
  type        = string
  description = "Namespace to create Kubernetes service account for token reviewing"
  default     = "vault"

  validation {
    condition     = length(var.namespace) < 64
    error_message = "Namespace must contain at most 63 characters."
  }

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.namespace))
    error_message = "Namespace must contain only lowercase alphanumeric characters or '-'."
  }

  validation {
    condition     = can(regex("^[a-z0-9]", var.namespace))
    error_message = "Namespace must start with an alphanumeric character."
  }

  validation {
    condition     = can(regex("[a-z0-9]$", var.namespace))
    error_message = "Namespace must end with an alphanumeric character."
  }
}

variable "service_account" {
  sensitive   = false
  type        = string
  description = "Name to give the Kubernetes service account that will do token reviewing"
  default     = "vault-k8s-auth"

  validation {
    condition     = length(var.service_account) < 64
    error_message = "Service account must contain at most 63 characters."
  }

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.service_account))
    error_message = "Service account must contain only lowercase alphanumeric characters or '-'."
  }

  validation {
    condition     = can(regex("^[a-z0-9]", var.service_account))
    error_message = "Service account must start with an alphanumeric character."
  }

  validation {
    condition     = can(regex("[a-z0-9]$", var.service_account))
    error_message = "Service account must end with an alphanumeric character."
  }
}

variable "cluster_role_bind_name" {
  sensitive   = false
  type        = string
  description = "Name to give the Kubernetes role binding that will give token reviewing permissions"
  default     = "vault-k8s-auth-delegator"

  validation {
    condition     = length(var.cluster_role_bind_name) < 64
    error_message = "Cluster role bind name must contain at most 63 characters."
  }

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.cluster_role_bind_name))
    error_message = "Cluster role bind name must contain only lowercase alphanumeric characters or '-'."
  }

  validation {
    condition     = can(regex("^[a-z0-9]", var.cluster_role_bind_name))
    error_message = "Cluster role bind name must start with an alphanumeric character."
  }

  validation {
    condition     = can(regex("[a-z0-9]$", var.cluster_role_bind_name))
    error_message = "Cluster role bind name must end with an alphanumeric character."
  }
}

variable "jwt_issuer" {
  sensitive   = false
  type        = string
  description = "JWT issuer"
  default     = "kubernetes/serviceaccount"
}

variable "mount_name" {
  sensitive   = false
  type        = string
  description = "Name of the Kubernetes auth mount in Vault"
}

variable "cluster_endpoint" {
  sensitive   = false
  type        = string
  description = "Cluster endpoint of the Kubernetes host. Include the https/http"

  validation {
    condition     = can(regex("^http(s)?://", var.cluster_endpoint))
    error_message = "Cluster endpoint must begin with 'http://' or 'https://'."
  }
}

variable "cluster_ca" {
  sensitive   = true
  type        = string
  description = "Base64 encoded CA cert for the given Kubernetes cluster"

  validation {
    condition     = can(regex("^[a-zA-Z0-9+/=]+$", var.cluster_endpoint))
    error_message = "Cluster CA must be a base64 encoded string."
  }
}
