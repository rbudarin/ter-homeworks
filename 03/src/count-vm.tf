# VM_WEB (2)
resource "yandex_compute_instance" "web" {
  count = 2
  
  name        = "web-${count.index + 1}"
  hostname    = "web-${count.index + 1}"
  platform_id = var.web_platform
  zone        = "ru-central1-a"
  
  resources {
    cores         = var.vms_resources[0].cores
    memory        = var.vms_resources[0].memory
    core_fraction = var.vms_resources[0].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.vm_web_hdd[0].type
      size     = var.vm_web_hdd[0].size
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.public_key}"
  }
  
  scheduling_policy { preemptible = true }
  
  network_interface {
    security_group_ids = [yandex_vpc_security_group.example.id]
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
}
