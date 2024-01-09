resource "yandex_vpc_network" "private" {
  name = "private-network1"
}

resource "yandex_vpc_network" "public" {
  name = "public-network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.private.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_subnet" "subnet-2" {
  name           = "subnet2"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.public.id
  v4_cidr_blocks = ["192.168.20.0/24"]
}

resource "yandex_vpc_security_group" "public-sg" {
  name           = "publicsg"
  description = "public rules 443, 80, 22"
  network_id  = yandex_vpc_network.public.id

  ingress {
    description       = "Allow HTTPS"
    protocol          = "TCP"
    port              = 443
    v4_cidr_blocks = ["0.0.0.0/0"]
    #predefined_target = "self_security_group"
  }

  ingress {
    description       = "Allow HTTP"
    protocol          = "TCP"
    port              = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
    #predefined_target = "self_security_group"
  }

  ingress {
    description       = "Allow SSH"
    protocol          = "TCP"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port              = 22
    #predefined_target = "self_security_group"
  }

  egress {
    protocol          = "ANY"
    description       = "The rule allows all outgoing traffic."
    v4_cidr_blocks    = ["0.0.0.0/0"]
    from_port         = 0
    to_port           = 65535
    #predefined_target = "self_security_group"
  }
}

resource "yandex_vpc_security_group" "private-sg" {
  name           = "privatesg"
  description = "private rules 8080"
  network_id  = yandex_vpc_network.private.id

  ingress {
    description       = "Allow HTTP"
    protocol          = "TCP"
    port              = 8080
    v4_cidr_blocks = ["0.0.0.0/0"]
    #predefined_target = "self_security_group"
  }

  ingress {
    description       = "Allow SSH"
    protocol          = "TCP"
    port              = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
    #predefined_target = "self_security_group"
  }

  egress {
    protocol          = "ANY"
    description       = "The rule allows all outgoing traffic."
    v4_cidr_blocks    = ["0.0.0.0/0"]
    from_port         = 0
    to_port           = 65535
    #predefined_target = "self_security_group"
  }
}