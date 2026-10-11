variable "biglake_iceberg_namespace_iam_members" {
  description = <<EOT
Map of biglake_iceberg_namespace_iam_members, attributes below
Required:
    - catalog
    - member
    - namespace_id
    - role
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    catalog      = string
    member       = string
    namespace_id = string
    role         = string
    project      = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

