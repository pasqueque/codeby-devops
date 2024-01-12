variable "vpc-id-var-module" {
    type = string
    default = "enp24n2mde8rnblhig39"
}

data "yandex_vpc_network" "network" {
  network_id = var.vpc-id-var-module
}

data "yandex_vpc_subnet" "net-subnet" {
  for_each = toset(data.yandex_vpc_network.network.subnet_ids)
  subnet_id = each.value
}


