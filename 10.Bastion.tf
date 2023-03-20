resource "aws_instance" "jump-ssh" {
  ami = "ami-05c8486d62efc5d07"
  subnet_id = aws_subnet.public_subnet_az1.id
  instance_type = "t2.micro"
  key_name = "cfn-key-1"
  security_groups = [aws_security_group.ssh_security_group.id]
  tags = {
    Name = "jump-host"
  }
}