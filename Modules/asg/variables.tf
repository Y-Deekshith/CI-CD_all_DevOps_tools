variable "name" {}
variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "sg_ids" {}
variable "alb" {}
variable "public_subnets" {
    type = list
}