data "aws_ami" "joindevops" {
    owners = [973714476881]
    most_recent = true
    filter {
        name =  "name"
        values = ["Redhat-9-DevOps-Practice"]
    }

    filter {
    name   = "image-id"
    values = ["ami-0220d79f3f480ecf5"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


