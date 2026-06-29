output "instance_id" {
  value = module.EC2.instance_id
}

output "vpc_id" {
  value = module.VPC.vpc_id
}

output "sg_id" {
  value = module.SG.sg_id
}