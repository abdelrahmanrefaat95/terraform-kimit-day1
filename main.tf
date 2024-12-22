resource "aws_instance" "demo-ec2" {
  tags = {
    Name : "demo-kimit-2"
  }
  ami             = var.hamada
  instance_type   = var.instance-family
  key_name        = aws_key_pair.my-key.key_name
  security_groups = [aws_security_group.ssh-sg.name]
}


resource "aws_key_pair" "my-key" {
  key_name   = "my-demo-key"
  public_key = file("terraform-key.pub")

}

resource "aws_security_group" "ssh-sg" {
  name        = "demo-sg-test"
  description = "allow ssh connection"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}