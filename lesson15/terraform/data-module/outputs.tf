output "nework-out" {
  value = [data.yandex_vpc_network.network.network_id, data.yandex_vpc_network.network.name]
}

output "nework-subnets" {
  value = data.yandex_vpc_network.network.subnet_ids
}

output "subnets-out" {
  value = {
    for key, subnet in data.yandex_vpc_subnet.net-subnet : 
    key => {
      name             = subnet.name
      zone             = subnet.zone
      description      = subnet.description
      v4_cidr_blocks   = subnet.v4_cidr_blocks
    }
  }
}

output "subnet-zones-module" {
  value = {
    for key, subnet in data.yandex_vpc_subnet.net-subnet: 
    key => subnet.zone
  }
}