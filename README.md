<!--- BEGIN_TF_DOCS --->
<!-- markdownlint-disable MD024 MD033 -->
# terraform-vault-k8sauth

Terraform module for configuring a Kubernetes authentication backend in Vault

## Requirements

The following requirements are needed by this module:

- terraform (~> 1.0)

- kubernetes (~> 2.8)

- vault (~> 3.3)

## Required Inputs

The following input variables are required:

### cluster\_ca

Description: Base64 encoded CA cert for the given Kubernetes cluster

Type: `string`

### cluster\_endpoint

Description: Cluster endpoint of the Kubernetes host. Include the https/http

Type: `string`

### mount\_name

Description: Name of the Kubernetes auth mount in Vault

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### cluster\_role\_bind\_name

Description: Name to give the Kubernetes role binding that will give token reviewing permissions

Type: `string`

Default: `"vault-k8s-auth-delegator"`

### jwt\_issuer

Description: JWT issuer

Type: `string`

Default: `"kubernetes/serviceaccount"`

### namespace

Description: Namespace to create Kubernetes service account for token reviewing

Type: `string`

Default: `"vault"`

### service\_account

Description: Name to give the Kubernetes service account that will do token reviewing

Type: `string`

Default: `"vault-k8s-auth"`

## Outputs

The following outputs are exported:

### accessor

Description: Vault mount accessor

### namespace

Description: Name of the Kubernetes namespace that was created.

### path

Description: Vault mount path

## Contributing

Contributions are always welcome. Please consult our [CONTRIBUTING.md](CONTRIBUTING.md) file for more information on how to submit quality contributions.

## License & Authors

Author: Brian Menges (@mengesb)

```text
Copyright 2022 Brian Menges

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

<!--- END_TF_DOCS --->
