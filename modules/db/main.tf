resource "aws_rds_cluster_instance" "postgresql" {
  identifier         = var.instance_identifier
  cluster_identifier = aws_rds_cluster.postgresql.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.postgresql.engine
  engine_version     = aws_rds_cluster.postgresql.engine_version
}

resource "aws_rds_cluster" "postgresql" {
  cluster_identifier      = var.cluster_identifier
  engine                  = var.engine
  engine_version          = var.engine_version
  database_name           = var.db_name
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = var.backup_retention_period
  storage_encrypted       = var.storage_encrypted
}

resource "aws_kms_key" "secret_manager_kms_key" {
  description         = "KMS key for Secrets Manager encryption"
  enable_key_rotation = true
}

resource "aws_secretsmanager_secret" "db_secret" {
  name       = "db-connection-info"
  kms_key_id = aws_kms_key.secret_manager_kms_key.key_id
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    "host"     = aws_rds_cluster.postgresql.endpoint,
    "db_name"  = aws_rds_cluster.postgresql.database_name,
    "username" = var.master_username,
    "password" = var.master_password
  })
}
