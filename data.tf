data "aws_ssm_parameter" "username" {
  name = "roboshop.${var.env}.docdb.amqp_username"
}

data "aws_ssm_parameter" "password" {
  name = "roboshop.${var.env}.docdb.amqp_password"
}
