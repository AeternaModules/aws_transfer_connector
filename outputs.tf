output "transfer_connectors_id" {
  description = "Map of id values across all transfer_connectors, keyed the same as var.transfer_connectors"
  value       = { for k, v in aws_transfer_connector.transfer_connectors : k => v.id if v.id != null && length(v.id) > 0 }
}
output "transfer_connectors_access_role" {
  description = "Map of access_role values across all transfer_connectors, keyed the same as var.transfer_connectors"
  value       = { for k, v in aws_transfer_connector.transfer_connectors : k => v.access_role if v.access_role != null && length(v.access_role) > 0 }
}
output "transfer_connectors_arn" {
  description = "Map of arn values across all transfer_connectors, keyed the same as var.transfer_connectors"
  value       = { for k, v in aws_transfer_connector.transfer_connectors : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "transfer_connectors_as2_config" {
  description = "Map of as2_config values across all transfer_connectors, keyed the same as var.transfer_connectors"
  value       = { for k, v in aws_transfer_connector.transfer_connectors : k => one(v.as2_config) if v.as2_config != null && length(v.as2_config) > 0 }
}
output "transfer_connectors_connector_id" {
  description = "Map of connector_id values across all transfer_connectors, keyed the same as var.transfer_connectors"
  value       = { for k, v in aws_transfer_connector.transfer_connectors : k => v.connector_id if v.connector_id != null && length(v.connector_id) > 0 }
}
output "transfer_connectors_egress_config" {
  description = "Map of egress_config values across all transfer_connectors, keyed the same as var.transfer_connectors"
  value       = { for k, v in aws_transfer_connector.transfer_connectors : k => one(v.egress_config) if v.egress_config != null && length(v.egress_config) > 0 }
}
output "transfer_connectors_logging_role" {
  description = "Map of logging_role values across all transfer_connectors, keyed the same as var.transfer_connectors"
  value       = { for k, v in aws_transfer_connector.transfer_connectors : k => v.logging_role if v.logging_role != null && length(v.logging_role) > 0 }
}
output "transfer_connectors_region" {
  description = "Map of region values across all transfer_connectors, keyed the same as var.transfer_connectors"
  value       = { for k, v in aws_transfer_connector.transfer_connectors : k => v.region if v.region != null && length(v.region) > 0 }
}
output "transfer_connectors_security_policy_name" {
  description = "Map of security_policy_name values across all transfer_connectors, keyed the same as var.transfer_connectors"
  value       = { for k, v in aws_transfer_connector.transfer_connectors : k => v.security_policy_name if v.security_policy_name != null && length(v.security_policy_name) > 0 }
}
output "transfer_connectors_sftp_config" {
  description = "Map of sftp_config values across all transfer_connectors, keyed the same as var.transfer_connectors"
  value       = { for k, v in aws_transfer_connector.transfer_connectors : k => one(v.sftp_config) if v.sftp_config != null && length(v.sftp_config) > 0 }
}
output "transfer_connectors_tags" {
  description = "Map of tags values across all transfer_connectors, keyed the same as var.transfer_connectors"
  value       = { for k, v in aws_transfer_connector.transfer_connectors : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "transfer_connectors_tags_all" {
  description = "Map of tags_all values across all transfer_connectors, keyed the same as var.transfer_connectors"
  value       = { for k, v in aws_transfer_connector.transfer_connectors : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "transfer_connectors_url" {
  description = "Map of url values across all transfer_connectors, keyed the same as var.transfer_connectors"
  value       = { for k, v in aws_transfer_connector.transfer_connectors : k => v.url if v.url != null && length(v.url) > 0 }
}

