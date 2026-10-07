resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "main_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main_vpc.id
    count = length(var.availability_zones)
    availability_zone = var.availability_zones[count.index]
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.project_name}-public-${var.availability_zones}[count.index]" }
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.main_vpc.id
    count = length(var.availability_zones)
    availability_zone = var.availability_zones[count.index]
    map_public_ip_on_launch = false
    tags = {
        Name = "${var.project_name}-private-${var.availability_zones}[count.index]"
    }
}