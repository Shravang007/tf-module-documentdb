resource "aws_docdb_subnet_group" "main" {
  name       = "${var.component}-${var.env}"
  subnet_ids = var.subnet_ids

  tags = merge({ Name = "${var.component}-${var.env}" }, var.tags)
}

resource "aws_docdb_cluster" "main" {
  cluster_identifier      = "${var.component}-${var.env}"
  engine                  = var.engine
  master_username         = data.aws_ssm_parameter.username.value
  master_password         = data.aws_ssm_parameter.password.value
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_docdb_subnet_group.main.name
}

