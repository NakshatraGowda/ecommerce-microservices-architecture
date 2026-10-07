terraform{
    required.providers{
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
        http = {
            source = "hashicorp/http"
        }
    }
}

variable "region"{
    default = "ap-south-1"
    description = "mumbai region"
}

variable "ami" {
    default = "ami-01a00762f46d584a1"
    description = "AMI for ubuntu server"
}

provider "aws" {
    region = var.region
}

resource "aws_vpc" "main_vpc"{
    cidr = "10.0.0.0/16"
    tags{
        Name = "prod"
        Environment = "production"
    }
}

resource "aws_internet_gateway" "main_gateway"{
    vpc_id = aws_vpc.main_vpc.id
    tags{
        Name = "gateway"
    }
}

resource "aws_subnet" "private_subnet"{
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = false
    tags{
        Name = "private-subnet-1"
    }
}

resource "aws_subnet" "public_subnet"{
    vpc_id = aws_instance.main_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = true
    tags{
        Name = "public_subnet-1"
    }
}