vpc_cidr_block       = "10.50.0.0/16"
vpc_instance_tenancy = "default"
vpc_name             = "DeDev"
vpc_env              = "Dev"
# instancetype       = "t2.micro"
# ami                = "ami-06878d265978313ca"
# key_name           = "NVirginiaPC"
subnet_azs     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
public_cidrs   = ["10.50.1.0/24", "10.50.2.0/24", "10.50.3.0/24"]
private_cidrs  = ["10.50.10.0/24"]
sg_cidr_blocks = ["0.0.0.0/0"]