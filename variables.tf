variable "bucket_name" {
  type        = string
  description = "Name of your S3 bucket."
}
variable "tags" {
  type        = map(any)
  default     = null
  description = "Map of tags."
}
variable "canned_acl" {
  type        = string
  default     = "private"
  description = "One of AWS Canned ACLs https://docs.aws.amazon.com/AmazonS3/latest/userguide/acl-overview.html#canned-acl"
}
variable "versioning_enabled" {
  type        = string
  default     = "Enabled"
  description = "Determines whether or not bucket versioning is enabled."
  validation {
    condition = anytrue([
      var.versioning_enabled == "Enabled",
      var.versioning_enabled == "Suspended"
    ])
    error_message = "Variable 'versioning_enabled' must be 'Enabled' or 'Suspended'."
  }
}
variable "s3_logging_bucket" {
  type        = string
  default     = null
  description = "Bucket where S3 access logs should be stored"
}
variable "s3_logging_prefix" {
  type        = string
  default     = "log/"
  description = "Prefix used for S3 access logs."
}
variable "block_public_acls" {
  type        = bool
  default     = true
  description = "Public access block setting."
}
variable "block_public_policy" {
  type        = bool
  default     = true
  description = "Public access block setting."
}
variable "ignore_public_acls" {
  type        = bool
  default     = true
  description = "Public access block setting."
}
variable "restrict_public_buckets" {
  type        = bool
  default     = true
  description = "Public access block setting."
}
variable "enable_encryption" {
  type        = bool
  default     = true
  description = "Determines if bucket encryption is enabled."
}
variable "encryption_algorithm" {
  type        = string
  default     = "AES256"
  description = "The server-side encryption algorithm to use. Valid values are 'AES256' and 'aws:kms'."
  validation {
    condition = anytrue([
      var.encryption_algorithm == "AES256",
      var.encryption_algorithm == "aws:kms"
    ])
    error_message = "Variable 'encryption_algorithm' must be 'AES256' or 'aws:kms'."
  }
}
variable "kms_key_id" {
  type        = string
  default     = null
  description = "KMS key ID to use for encryption. If no key is given, then it will use default AWS SSE key."
}
variable "create_force_ssl_policy" {
  type        = bool
  default     = false
  description = "This will create a bucket policy forcing SSL. Set to false if you need to use any other policy, including one that includes it's own SSL forcing."
}
variable "enable_logging" {
  type        = bool
  default     = true
  description = "Determines if logging is enabled. Set to false for buckets that store logs, and thus should not be logging."
}
variable "use_bucket_acl" {
  type        = bool
  default     = false
  description = "AWS defaults to no ACL (recommended), which means other accounts cannot access objects. An ACL is only required if external entities need access"
}