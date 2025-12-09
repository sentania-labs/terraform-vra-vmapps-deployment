/******************************************
 * Required
 ******************************************/

variable "project_name" {
  type        = string
  description = "Name of the vRA Project where the deployment is created"
}

variable "deployment_name" {
  type        = string
  description = "Name of the deployment"
}

/******************************************
 * Optional metadata
 ******************************************/

variable "description" {
  type        = string
  description = "Description of the deployment"
  default     = null
}

/******************************************
 * Launch source: blueprint vs catalog item
 ******************************************/

variable "blueprint_name" {
  type        = string
  description = "Name of the blueprint used to create the deployment (mutually exclusive with catalog_item_name)"
  default     = null

  validation {
    condition = (
      (var.blueprint_name != null ? 1 : 0) +
      (var.catalog_item_name != null ? 1 : 0)
    ) == 1
    error_message = "Exactly one of blueprint_name or catalog_item_name must be set."
  }
}

variable "blueprint_version" {
  type        = string
  description = "Version of the blueprint to use (optional, only valid when blueprint_name is set)"
  default     = null

  validation {
    condition = (
      var.blueprint_version == null ||
      (var.blueprint_name != null && var.catalog_item_name == null)
    )
    error_message = "blueprint_version can only be set when using a blueprint (blueprint_name set and catalog_item_name unset)."
  }
}

variable "catalog_item_name" {
  type        = string
  description = "Name of the catalog item used to create the deployment (mutually exclusive with blueprint_name)"
  default     = null
}

variable "catalog_item_version" {
  type        = string
  description = "Version of the catalog item (optional; if null, provider will typically use the latest)"
  default     = null
}

/******************************************
 * Deployment inputs
 ******************************************/

variable "inputs" {
  type        = any
  description = "Inputs passed to the blueprint or catalog item"
  default     = {}
}
