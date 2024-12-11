# Network
resource "yandex_vpc_network" "stage" {
  name = "stage"
}

# Subnet
resource "yandex_vpc_subnet" "stage" {
  name           = "stage-ru-central1-a"
  zone           = "ru-central1-a" #Это очень важно  при создании ресурса в зоне отличной от Зоны по-умолчанию("ru-central1-a")! 
  network_id     = yandex_vpc_network.stage.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}


# Image
data "yandex_compute_image" "debian" {
  family = "debian-12"
}

# VM - resource
resource "yandex_compute_instance" "example-a" {
  name        = "deb12-stage"
  hostname    = "deb12-stage"
  platform_id = "standard-v3"

  zone = "ru-central1-a" #Это очень важно  при создании ресурса в зоне отличной от Зоны по-умолчанию("ru-central1-a")! 

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.debian.image_id
      type     = "network-hdd"
      size     = 10
    }
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.stage.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    #ssh-keygen -t ed25519  Забудьте уже про rsa ключи!!
    # ubuntu - дефолтный пользователь в ubuntu :)
    ssh-keys = "debian:${var.public_key}"
    #ssh-keys = "debian:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM8Y5gZi2PbtFC3yNQ9lXV92vvwDOnRxB6dZsXgZFkFd budarin@OSA-DEB-PC19"
  }

}
