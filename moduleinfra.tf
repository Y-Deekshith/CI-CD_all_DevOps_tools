module "vpc_infra" {
  source           = "./Modules/vpc"
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.vpc_instance_tenancy
  name             = var.vpc_name
  env              = var.vpc_env
}