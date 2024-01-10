resource "yandex_compute_instance" "private_vm" {
  name = "private-terraform1"

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
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true

    security_group_ids = [yandex_vpc_security_group.private-sg.id]
  }

  metadata = {
    #ssh-keys = "ubuntu:${file("~/.ssh/yc_id_ed25519.pub")}"
    user-data = "${file("./meta.txt")}"
  }


  provisioner "local-exec" {
    command = "sed -i '/\\[web\\]/a ${yandex_compute_instance.private_vm.network_interface.0.nat_ip_address}' ./inventory_private"
    on_failure = continue
  }
  
  provisioner "local-exec" {
    command = "sleep 5 && ansible-playbook -D -i ./inventory_private -u cadm ${path.module}/provision/playbook_private.yml"
    on_failure = continue
  }  
}

resource "yandex_compute_instance" "public_vm" {
  name = "public-terraform2"

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
    subnet_id = yandex_vpc_subnet.subnet-2.id
    nat       = true

    security_group_ids = [yandex_vpc_security_group.public-sg.id]
  }

  metadata = {
    #ssh-keys = "ubuntu:${file("~/.ssh/yc_id_ed25519.pub")}"
    user-data = "${file("./meta.txt")}"
  }

  provisioner "local-exec" {
    command = "sed -i '/\\[web_pub\\]/a ${yandex_compute_instance.public_vm.network_interface.0.nat_ip_address}' ./inventory_public"
    on_failure = continue
  }

  provisioner "local-exec" {
    command = "sleep 5 && ansible-playbook -D -i ./inventory_public -u cadm ${path.module}/provision/playbook_public.yml"
    on_failure = continue
  }  
}
