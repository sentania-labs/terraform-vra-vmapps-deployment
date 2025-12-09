<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.9 |
| <a name="requirement_vra"></a> [vra](#requirement\_vra) | >= 0.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vra"></a> [vra](#provider\_vra) | 0.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vra_deployment.this](https://registry.terraform.io/providers/vmware/vra/latest/docs/resources/deployment) | resource |
| [vra_blueprint.this](https://registry.terraform.io/providers/vmware/vra/latest/docs/data-sources/blueprint) | data source |
| [vra_catalog_item.this](https://registry.terraform.io/providers/vmware/vra/latest/docs/data-sources/catalog_item) | data source |
| [vra_project.this](https://registry.terraform.io/providers/vmware/vra/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_blueprint_name"></a> [blueprint\_name](#input\_blueprint\_name) | Name of the blueprint used to create the deployment (mutually exclusive with catalog\_item\_name) | `string` | `null` | no |
| <a name="input_blueprint_version"></a> [blueprint\_version](#input\_blueprint\_version) | Version of the blueprint to use (optional, only valid when blueprint\_name is set) | `string` | `null` | no |
| <a name="input_catalog_item_name"></a> [catalog\_item\_name](#input\_catalog\_item\_name) | Name of the catalog item used to create the deployment (mutually exclusive with blueprint\_name) | `string` | `null` | no |
| <a name="input_catalog_item_version"></a> [catalog\_item\_version](#input\_catalog\_item\_version) | Version of the catalog item (optional; if null, provider will typically use the latest) | `string` | `null` | no |
| <a name="input_deployment_name"></a> [deployment\_name](#input\_deployment\_name) | Name of the deployment | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of the deployment | `string` | `null` | no |
| <a name="input_inputs"></a> [inputs](#input\_inputs) | Inputs passed to the blueprint or catalog item | `map(any)` | `{}` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the vRA Project where the deployment is created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_deployment_info"></a> [deployment\_info](#output\_deployment\_info) | n/a |
<!-- END_TF_DOCS -->