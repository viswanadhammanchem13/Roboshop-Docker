##Creating Security Groups for Roboshop Application.

#Creating Security Group for Frontend.
module "frontend" {
    # source = "../../terrafrom-aws-securitygroup"
    source = "git::https://github.com/viswanadhammanchem13/terraform-aws-securitygroup.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.Docker_sg_name
    sg_description = var.Docker_description
    vpc-id = local.vpc_id
}


##Docker Server
resource "aws_security_group_rule" "DockerServer" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] # Source
  security_group_id = module.bastion.sg_id
}





