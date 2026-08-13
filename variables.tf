variable "transfer_connectors" {
  description = <<EOT
Map of transfer_connectors, attributes below
Required:
    - access_role
Optional:
    - logging_role
    - region
    - security_policy_name
    - tags
    - tags_all
    - url
    - as2_config (block):
        - compression (required)
        - encryption_algorithm (required)
        - local_profile_id (required)
        - mdn_response (required)
        - mdn_signing_algorithm (optional)
        - message_subject (optional)
        - partner_profile_id (required)
        - signing_algorithm (required)
    - egress_config (block):
        - vpc_lattice (optional, block):
            - port_number (optional)
            - resource_configuration_arn (required)
    - sftp_config (block):
        - trusted_host_keys (optional)
        - user_secret_id (optional)
EOT

  type = map(object({
    access_role          = string
    logging_role         = optional(string)
    region               = optional(string)
    security_policy_name = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    url                  = optional(string)
    as2_config = optional(object({
      compression           = string
      encryption_algorithm  = string
      local_profile_id      = string
      mdn_response          = string
      mdn_signing_algorithm = optional(string)
      message_subject       = optional(string)
      partner_profile_id    = string
      signing_algorithm     = string
    }))
    egress_config = optional(object({
      vpc_lattice = optional(object({
        port_number                = optional(number)
        resource_configuration_arn = string
      }))
    }))
    sftp_config = optional(object({
      trusted_host_keys = optional(set(string))
      user_secret_id    = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.transfer_connectors : (
        v.egress_config == null || (v.egress_config.vpc_lattice == null || (v.egress_config.vpc_lattice.port_number == null || (v.egress_config.vpc_lattice.port_number >= 1 && v.egress_config.vpc_lattice.port_number <= 65535)))
      )
    ])
    error_message = "must be between 1 and 65535"
  }
  validation {
    condition = alltrue([
      for k, v in var.transfer_connectors : (
        v.security_policy_name == null || ((length(v.security_policy_name) >= 0 && length(v.security_policy_name) <= 100) && (can(regex("^TransferSFTPConnectorSecurityPolicy-[A-Za-z0-9-]+$", v.security_policy_name))))
      )
    ])
    error_message = "all of: must be between 0 and 100 characters; must be in the format matching TransferSFTPConnectorSecurityPolicy-[A-Za-z0-9-]+"
  }
  validation {
    condition = alltrue([
      for k, v in var.transfer_connectors : (
        v.sftp_config == null || (v.sftp_config.trusted_host_keys == null || (alltrue([for x in v.sftp_config.trusted_host_keys : length(x) >= 1 && length(x) <= 2028])))
      )
    ])
    error_message = "must be between 1 and 2028 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.transfer_connectors : (
        v.sftp_config == null || (v.sftp_config.user_secret_id == null || (length(v.sftp_config.user_secret_id) >= 1 && length(v.sftp_config.user_secret_id) <= 2028))
      )
    ])
    error_message = "must be between 1 and 2028 characters"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

