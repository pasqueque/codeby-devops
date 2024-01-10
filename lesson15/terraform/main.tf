module "data-module-subnet-info" {
  source    = "./data-module"
  vpc-id-var-module = var.vpc-id-var
}

output "nework-out-module" {
  value = module.data-module-subnet-info
}

output "subnet-zone-out-module" {
  value = module.data-module-subnet-info.subnet-zones-module
}


 module "instance-module-vpc-auto" {
  source = "./instance-vpc-zone"
  subnet_zones = module.data-module-subnet-info.subnet-zones-module
 }