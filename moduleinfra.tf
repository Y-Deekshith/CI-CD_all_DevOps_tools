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
  name               = var.vpc_name
  env                = var.vpc_env
  igw_id             = module.gateway_infra.igw_id
  ngw_id             = module.gateway_infra.natgw_id
}

module "gateway_infra" {
  source         = "./Modules/gateway"
  name           = var.vpc_name
  vpc_id         = module.vpc_infra.vpc_id
  publicsubnet_1 = module.subnets_infra.public_subnet_1
}
module "routing_infra" {
  source   = "./Modules/routing"
  name     = var.vpc_name
  vpc_id   = module.vpc_infra.vpc_id
  igw_id   = module.gateway_infra.igw_id
  natgw_id = module.gateway_infra.natgw_id
}
module "security_infra" {
  source         = "./Modules/security"
  sg_cidr_blocks = var.sg_cidr_blocks
  name           = var.vpc_name
  vpc_id         = module.vpc_infra.vpc_id
}

