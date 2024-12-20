resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop_web" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "develop_db" {
  name           = var.vpc_name_db
  zone           = var.default_zone_db
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_db
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_images
}

# VM_WEB 
resource "yandex_compute_instance" "platform_web" {
  name        = local.web_name
  hostname    = var.vm_web_platform_name
  platform_id = var.vm_web_platform_id
  zone = var.default_zone
  resources {
    cores         = var.vms_resources.vm_web.cores
    memory        = var.vms_resources.vm_web.memory
    core_fraction = var.vms_resources.vm_web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_web.id
    nat       = true
  }
  metadata = var.metadata
  # metadata = {
  #   serial-port-enable = 1
  #   ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  # }
}

# VM_DB
resource "yandex_compute_instance" "platform_db" {
  name        = local.db_name
  hostname    = var.vm_db_platform_name
  platform_id = var.vm_db_platform_id
  zone = var.default_zone_db
  resources {
    cores         = var.vms_resources.vm_db.cores
    memory        = var.vms_resources.vm_db.memory
    core_fraction = var.vms_resources.vm_db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id
    nat       = true
  }
  metadata = var.metadata
  # metadata = {
  #   serial-port-enable = 1
  #   ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  # }
}
