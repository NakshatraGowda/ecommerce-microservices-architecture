provider "aws" {
    region = var.region

    default_tags {
    tags = {
      Environment = "production"
      Project     = "eks-platform"
      ManagedBy   = "Terraform"
    }
  }
}