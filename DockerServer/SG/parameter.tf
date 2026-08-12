
## Exporting the security group id to SSM parameter store for later use in other modules

resource "aws_ssm_parameter" "Docker_sg_id" {
    name  = "/${var.project}/${var.environment}/Docker_sg_id"
    type = "String"
    value = module.frontend.sg_id
}

