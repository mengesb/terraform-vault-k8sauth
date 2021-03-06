#
# Terraform:: terraform-vault-k8sauth
# Plan:: main.tf
#

resource "kubernetes_namespace" "vault_namespace" {
  metadata {
    labels = {
      app = "vault-agent-injector"
    }

    name = var.namespace
  }
}

resource "kubernetes_service_account" "sa" {
  metadata {
    namespace = kubernetes_namespace.vault_namespace.metadata[0].name
    name      = var.service_account
  }
}

data "kubernetes_secret" "sa_secret" {
  metadata {
    namespace = kubernetes_namespace.vault_namespace.metadata[0].name
    name      = kubernetes_service_account.sa.default_secret_name
  }
}

resource "kubernetes_cluster_role_binding" "role_bind" {
  metadata {
    name = var.cluster_role_bind_name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "system:auth-delegator"
  }

  subject {
    kind      = "ServiceAccount"
    name      = var.service_account
    namespace = kubernetes_namespace.vault_namespace.metadata[0].name
  }
}

resource "vault_auth_backend" "backend" {
  type = "kubernetes"
  path = var.mount_name
}

resource "vault_kubernetes_auth_backend_config" "configs" {
  backend            = vault_auth_backend.backend.path
  kubernetes_host    = var.cluster_endpoint
  kubernetes_ca_cert = base64decode(var.cluster_ca)
  token_reviewer_jwt = data.kubernetes_secret.sa_secret.data["token"]
  issuer             = var.jwt_issuer
}
