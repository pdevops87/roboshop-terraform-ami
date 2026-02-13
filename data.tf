data "aws_security_group" "sg"{
  name = "allow-all"
}
data "aws_ami" "ami" {
  owners = ["973714476881"]
  most_recent = true
  filter {
    name = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }
}

