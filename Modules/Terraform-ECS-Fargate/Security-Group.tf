resource "aws_security_group" "SG1" {
  name        = "Main-SG1"
  description = "Allow Port 80"
  vpc_id      = aws_vpc.Main-VPC1.id

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

  tags = {
    Name = "Main-SG1"
  }
}
