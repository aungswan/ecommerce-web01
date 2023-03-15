resource "aws_eip" "eip_for_nat_gateway_az1" {
  vpc = true

  tags = {
    Name = "NAT GW AZ1 EIP"
  }
}

resource "aws_eip" "eip_for_nat_gateway_az2" {
  vpc = true

  tags = {
    Name = "NAT GW AZ1 EIP"
  }
}

resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.eip_for_nat_gateway_az1.id
  subnet_id = aws_subnet.public_subnet_az1.id

  tags = {
    Name = "Nat GW AZ1"
  }

  depends_on = [aws_internet_gateway.internet_gateway]
}

resource "aws_nat_gateway" "nat_gateway_az2" {
  allocation_id = aws_eip.eip_for_nat_gateway_az2.id
  subnet_id = aws_subnet.public_subnet_az2.id

  tags = {
    Name = "NAT GW AZ2"
  }

  depends_on = [aws_internet_gateway.internet_gateway]
}

resource "aws_route_table" "private_route_table_az1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az1.id
  }

  tags = {
    Name = "Private Routetable AZ1"
  }
}

resource "aws_route_table_association" "private_app_subnet_az1_route_table_az1_association" {
  subnet_id = aws_subnet.private_app_subnet_az1.id
  route_table_id = aws_route_table.private_route_table_az1.id
}

resource "aws_route_table_association" "private_data_subnet_az1_route_table_az1_association" {
  subnet_id = aws_subnet.private_db_subnet_az1.id
  route_table_id = aws_route_table.private_route_table_az1.id
}

resource "aws_route_table" "private_route_table_az2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az2.id
  }

  tags   = {
    Name = "Private Routetable AZ2"
  }
}

resource "aws_route_table_association" "private_app_subnet_az2_route_table_az2_association" {
  subnet_id = aws_subnet.private_app_subnet_az2.id
  route_table_id = aws_route_table.private_route_table_az2.id
}

resource "aws_route_table_association" "private_data_subnet_az2_route_table_az2_association" {
  subnet_id = aws_subnet.private_db_subnet_az2.id
  route_table_id = aws_route_table.private_route_table_az2.id
}