module "VPC" {

  source              = "./modules/VPC"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "SG" {
  source = "./modules/SG"
  vpc_id = module.VPC.vpc_id
}

module "EC2" {
  source        = "./modules/EC2"
  subnet_id     = module.VPC.public_subnet_id
  sg_id         = module.SG.sg_id
  ami_id        = var.ami_id
  instance_type = var.instance_type
}
