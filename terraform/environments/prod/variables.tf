variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

/*
variable "ami" {
    default = "ami-01a00762f46d584a1"
    description = "AMI for ubuntu server"
}
*/

variable "type" {
    default = "m7i-flex.large"
    description = "EC2 instance"
}

variable "cluster_name" {
    description = "eks cluster - microservices"
    type = string
    default = "production-eks"
}

variable "vpc_cidr" {
    description = "VPC CIDR"
    type = string
    default = "10.0.0.0/16"
}
