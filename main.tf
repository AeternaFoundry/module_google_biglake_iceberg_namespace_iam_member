resource "google_biglake_iceberg_namespace_iam_member" "biglake_iceberg_namespace_iam_members" {
  for_each = var.biglake_iceberg_namespace_iam_members

  catalog      = each.value.catalog
  member       = each.value.member
  namespace_id = each.value.namespace_id
  role         = each.value.role
  project      = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

