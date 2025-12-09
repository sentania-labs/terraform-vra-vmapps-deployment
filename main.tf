data "vra_project" "this" {
  name = var.project_name
}

data "vra_blueprint" "this" {
  for_each = var.blueprint_name != null ? { blueprint = var.blueprint_name } : {}
  name     = each.value
}

data "vra_catalog_item" "this" {
  for_each = var.catalog_item_name != null ? { catalog = var.catalog_item_name } : {}
  name     = each.value
}

resource "vra_deployment" "this" {
  name        = var.deployment_name
  description = var.description
  project_id  = data.vra_project.this.id

  blueprint_id = (
    length(data.vra_blueprint.this) > 0
    ? one(values(data.vra_blueprint.this)).id
    : null
  )

  blueprint_version = (
    var.blueprint_name != null
    ? var.blueprint_version
    : null
  )

  catalog_item_id = (
    length(data.vra_catalog_item.this) > 0
    ? one(values(data.vra_catalog_item.this)).id
    : null
  )

  catalog_item_version = (
    var.catalog_item_name != null && var.catalog_item_version != null
    ? var.catalog_item_version
    : null
  )

  inputs = {
    for k, v in var.inputs :
    k => (
      can(tostring(v)) && v == tostring(v)
      ? tostring(v)
      : jsonencode(v)
    )
  }

  timeouts {
    create = "60m"
    delete = "2h"
  }
}

