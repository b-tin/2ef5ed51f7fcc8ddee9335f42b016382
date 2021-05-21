locals {
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  public_subnets_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets_cidrs = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
  cluster_name = "eks-${var.environment}-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}


# module "networking" {
#   source = "./modules/networking"

#   region               = var.aws_region
#   environment          = var.environment
#   vpc_cidr             = var.vpc_cidr
#   public_subnets_cidr  = local.public_subnets_cidrs
#   private_subnets_cidr = local.private_subnets_cidrs
#   availability_zones   = local.availability_zones
# }

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-${var.environment}"
  cidr = var.vpc_cidr

  azs             = local.availability_zones
  private_subnets = local.private_subnets_cidrs
  public_subnets  = local.public_subnets_cidrs

  enable_nat_gateway = true
  enable_vpn_gateway = false
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}