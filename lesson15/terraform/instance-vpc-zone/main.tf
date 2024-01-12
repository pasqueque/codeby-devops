variable "subnet_zones" {
  type    = map(string)
  description = "Map of subnet IDs to their zones"
  default = {
    "subnet_id1" = "ru-central1-a"
    "subnet_id2" = "ru-central1-a"
  }

}


resource "yandex_compute_instance" "vm-instance" {
  for_each    = var.subnet_zones
  name        = "module-vm-${index(keys(var.subnet_zones), each.key)}"
  zone        = each.value

  resources {
    cores  = 2
    memory = 2
    core_fraction = 20 # %
  }

    boot_disk {
      initialize_params {
        image_id = "fd8c3dv7t6prd7j4n162"
      }
  }

  network_interface {
    subnet_id = each.key
    nat       = false
  }
}

