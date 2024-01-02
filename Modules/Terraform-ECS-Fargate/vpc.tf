resource "aws_vpc" "Main-VPC2" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Main-VPC2"
  }
}

resource "aws_subnet" "subnet111" {
  vpc_id                  = aws_vpc.Main-VPC2.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "Main-Subnet111"
  }
}


resource "aws_subnet" "subnet112" {
  vpc_id                  = aws_vpc.Main-VPC2.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "Main-Subnet112"
  }
}

resource "aws_internet_gateway" "IG2" {
  vpc_id = aws_vpc.Main-VPC2.id

  tags = {
    Name = "Main-Internet-Gateway112"
  }
}


resource "aws_route_table" "RT111" {
  vpc_id = aws_vpc.Main-VPC2.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IG2.id
  }
}


resource "aws_route_table_association" "RTA111" {
  subnet_id      = aws_subnet.Main-Subnet111.id
  route_table_id = aws_route_table.RT111.id
}


resource "aws_route_table_association" "RTA112" {
  subnet_id      = aws_subnet.Main-Subnet112.id
  route_table_id = aws_route_table.RT112.id
}
