# create an ec2 instance with existing ami
resource "aws_instance" "instance" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.id]
}

# run the ansible scripts like packages
resource "null_resource" "ansible" {
  provisioner "remote-exec" {
    connection {
      user = "ec2-user"
      password = "DevOps321"
      type = "ssh"
      host = aws_instance.instance.private_ip
    }
    inline = [
            "sudo dnf install python3.11-pip -y",
            "sudo pip3.11 install ansible"
    ]
  }
}