provider "vra" {
  url           = var.vcfa_url
  organization  = var.vcfa_organization
  refresh_token = var.vcfa_refresh_token
  insecure      = var.insecure
}

module "deployments" {
  source   = "../"
  for_each = var.deployments

  project_name    = each.value.project_name
  deployment_name = each.value.deployment_name
  description     = each.value.description
  inputs          = each.value.inputs

  # Blueprint path
  blueprint_name    = try(each.value.blueprint_name, null)
  blueprint_version = try(each.value.blueprint_version, null)

  # Catalog item path
  catalog_item_name    = try(each.value.catalog_item_name, null)
  catalog_item_version = try(each.value.catalog_item_version, null)
}
