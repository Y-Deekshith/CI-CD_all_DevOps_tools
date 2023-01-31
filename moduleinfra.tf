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
  mrtb               = module.routing_infra.mrtb_route_table
  crtb               = module.routing_infra.crtb_route_table
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
module "ec2_infra" {
  source                     = "./Modules/ec2"
  instancetype               = var.instance_type
  ami                        = var.ami
  key_name                   = var.key_name
  name                       = var.vpc_name
  publicsubnet_id            = module.subnets_infra.public_subnet_id
  security_group             = module.security_infra.security_group
  env                        = var.vpc_env
  privatesubnet_id           = module.subnets_infra.private_subnet_id
  private_ec2_depends_on_nat = module.gateway_infra.natgw_id
}

module "alb_infra" {
  source                  = "./Modules/alb"
  security_groups         = module.security_infra.security_group
  publicsubnet_cidr_block = module.subnets_infra.public_subnet_id
  name                    = var.vpc_name
  env                     = var.vpc_env
  vpc_id                  = module.vpc_infra.vpc_id
  instance                = module.ec2_infra.instance
}

module "asg_infra" {
  source         = "./Modules/asg"
  name           = var.vpc_name
  ami            = var.ami
  instance_type  = var.instance_type
  key_name       = var.key_name
  sg_ids         = [module.security_infra.security_group]
  alb            = [module.alb_infra.tgarn]
  public_subnets = module.subnets_infra.public_subnet_id
}