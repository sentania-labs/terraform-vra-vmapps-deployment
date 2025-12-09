variable "vcfa_url" {
  type        = string
  description = "vRA Cloud Automation URL"
}

variable "vcfa_organization" {
  type        = string
  description = "vRA organization name"
}

variable "vcfa_refresh_token" {
  type        = string
  description = "vRA refresh token"
  sensitive   = true
}

variable "insecure" {
  type        = bool
  description = "Allow insecure TLS"
  default     = false
}

variable "deployments" {
  description = "Map of deployments to create"
  type = map(object({
    project_name    = string
    deployment_name = string
    description     = optional(string)

    # Blueprint-based deployment
    blueprint_name    = optional(string)
    blueprint_version = optional(number)

    # Catalog-item-based deployment
    catalog_item_name    = optional(string)
    catalog_item_version = optional(string)

    # Blueprint / catalog inputs
    inputs = map(any)
  }))
}
