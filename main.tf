resource "aws_transfer_connector" "transfer_connectors" {
  for_each = var.transfer_connectors

  access_role          = each.value.access_role
  logging_role         = each.value.logging_role
  region               = each.value.region
  security_policy_name = each.value.security_policy_name
  tags                 = each.value.tags
  tags_all             = each.value.tags_all
  url                  = each.value.url

  dynamic "as2_config" {
    for_each = each.value.as2_config != null ? [each.value.as2_config] : []
    content {
      compression           = as2_config.value.compression
      encryption_algorithm  = as2_config.value.encryption_algorithm
      local_profile_id      = as2_config.value.local_profile_id
      mdn_response          = as2_config.value.mdn_response
      mdn_signing_algorithm = as2_config.value.mdn_signing_algorithm
      message_subject       = as2_config.value.message_subject
      partner_profile_id    = as2_config.value.partner_profile_id
      signing_algorithm     = as2_config.value.signing_algorithm
    }
  }

  dynamic "egress_config" {
    for_each = each.value.egress_config != null ? [each.value.egress_config] : []
    content {
      dynamic "vpc_lattice" {
        for_each = egress_config.value.vpc_lattice != null ? [egress_config.value.vpc_lattice] : []
        content {
          port_number                = vpc_lattice.value.port_number
          resource_configuration_arn = vpc_lattice.value.resource_configuration_arn
        }
      }
    }
  }

  dynamic "sftp_config" {
    for_each = each.value.sftp_config != null ? [each.value.sftp_config] : []
    content {
      trusted_host_keys = sftp_config.value.trusted_host_keys
      user_secret_id    = sftp_config.value.user_secret_id
    }
  }
}

