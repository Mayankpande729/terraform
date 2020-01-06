provider "aws" {
  region = "ap-south-1"
  version = "~> 2.43"
}

module "my_vpc" {
  source = "../../../../../../modules/network/vpc"
  subnet_id = local.subnet_id
}

module "my_ec2" {
  source = "../../../../../../modules/compute/ec2"
}

#module "my_rds" {
#  source = "../../../../../../modules/db"
#}
