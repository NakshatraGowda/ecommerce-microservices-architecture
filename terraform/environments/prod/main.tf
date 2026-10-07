module "vpc" {
  source = "../../modules/vpc"

  project_name = "eks-platform"

  vpc_cidr = var.vpc_cidr

  availability_zones = [
    "ap-south-1a",
    "ap-south-1b"
  ]

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnet_cidrs = [
    "10.0.11.0/20",
    "10.0.27.0/20"
  ]
}