data "aws_ami" "ami"{
  owners = ["973714476881"]
  filter {
    name = "Redhat-9-DevOps-Practice"
    values = ["ami-0220d79f3f480ecf5"]
  }
}
data "aws_security_group" "sg"{
  name = "allow-all"
}

