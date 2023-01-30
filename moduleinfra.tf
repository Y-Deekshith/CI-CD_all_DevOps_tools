module "vpc_infra" {
  source           = "./Modules/vpc"
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.vpc_instance_tenancy
  name             = var.vpc_name
  env              = var.vpc_env
}

module "subnets_infra" {
  source             = "./Modules/subnets"
  azs                = var.subnet_azs
  vpc_id             = module.vpc_infra.vpc_id
  public_cidr_block  = var.public_cidrs
  private_cidr_block = var.private_cidrs
  name               = module.vpc_infra.vpc_name
  env                = module.vpc_infra.vpc_env
}