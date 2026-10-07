variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "availability_zones"{
    description = "Availability zones"
    type = list(string)
    default = ["ap-south-1a","ap-south-1b","ap-south-1c"]
}

variable "public_subnet_cidrs" {
  description = "CIDRs for public subnets"
  type        = list(string)
  default = "10.0.1.0/24"
}

variable "private_subnet_cidrs" {
  description = "CIDRs for private subnets"
  type        = list(string)
  default = "10.0.2.0/24"
}