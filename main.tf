resource "aws_docdb_subnet_group" "main" {
  name       = "${var.component}-${var.env}"
  subnet_ids = var.subnet_ids

  tags = merge({ Name = "${var.component}-${var.env}" }, var.tags)
}

resource "aws_docdb_cluster" "main" {
  cluster_identifier      = "my-docdb-cluster"
  engine                  = "docdb"
  master_username         = "foo"
  master_password         = "mustbeeightchars"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
}

