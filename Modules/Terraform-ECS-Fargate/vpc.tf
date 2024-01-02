resource "aws_vpc" "Main-VPC1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Main-VPC1"
  }
}

resource "aws_subnet" "subnet11" {
  vpc_id                  = aws_vpc.Main-VPC1.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "Main-Subnet11"
  }
}


resource "aws_subnet" "subnet12" {
  vpc_id                  = aws_vpc.Main-VPC1.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "Main-Subnet12"
  }
}

resource "aws_internet_gateway" "IG1" {
  vpc_id = aws_vpc.Main-VPC1.id

  tags = {
    Name = "Main-Internet-Gateway12"
  }
}


resource "aws_route_table" "RT1" {
  vpc_id = aws_vpc.Main-VPC1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IG1.id
  }
}


resource "aws_route_table_association" "RTA11" {
  subnet_id      = aws_subnet.Main-Subnet11.id
  route_table_id = aws_route_table.RT1.id
}


resource "aws_route_table_association" "RTA12" {
  subnet_id      = aws_subnet.Main-Subnet12.id
  route_table_id = aws_route_table.RT1.id
}

