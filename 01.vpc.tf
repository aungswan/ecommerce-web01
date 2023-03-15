resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "dev01 vpc"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "dev01 IGW"
  }
}

resource "aws_subnet" "public_subnet_az1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_net_az1_cidr
  availability_zone = "ap-southeast-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "AZ1B Public Net"
  }
}

resource "aws_subnet" "public_subnet_az2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_net_az2_cidr 
  availability_zone = "ap-southeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "AZ2C Public Net"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table_association" "public_subnet_2_route_table_association" {
  subnet_id = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_subnet" "private_app_subnet_az1" {
  vpc_id = aws_vpc.vpc.id 
  cidr_block = var.private_app_net_az1_cidr
  availability_zone = "ap-southeast-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private APP Net AZ1B"
  }
}

resource "aws_subnet" "private_app_subnet_az2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_app_net_az2_cidr
  availability_zone = "ap-southeast-1c"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private APP Net AZ2C"
  }
}

resource "aws_subnet" "private_db_subnet_az1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_db_net_az1_cidr
  availability_zone = "ap-southeast-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private DB Net AZ1B"
  }
}

resource "aws_subnet" "private_db_subnet_az2" {
  vpc_id = aws_vpc.vpc.id 
  cidr_block = var.private_db_net_az2_cidr
  availability_zone = "ap-southeast-1c"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private DB Net AZ2C"
  }
}