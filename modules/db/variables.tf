variable "cluster_identifier" {
  description = "The identifier for the RDS cluster."
  type        = string
}

variable "engine" {
  description = "The name of the database engine to be used for the RDS cluster."
  type        = string
}

variable "engine_version" {
  description = "The version number of the database engine to be used for the RDS cluster."
  type        = string
}

variable "db_name" {
  description = "The name of the database to be created when the RDS cluster is launched."
  type        = string
}

variable "master_username" {
  description = "The name of the master user for the RDS cluster."
  type        = string
}

variable "master_password" {
  description = "The password for the master user."
  type        = string
}

variable "instance_identifier" {
  description = "The identifier for the RDS instance."
  type        = string
}

variable "instance_class" {
  description = "The compute and memory capacity of the RDS instance."
  type        = string
}

variable "backup_retention_period" {
  description = "Backup retention period"
  type        = number
  default     = 7
}

variable "storage_encrypted" {
  description = "Storage encrypted flag"
  type        = bool
  default     = true
}
