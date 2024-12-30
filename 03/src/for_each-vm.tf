# VM_DB (2)
resource "yandex_compute_instance" "vm_db" {
  depends_on = [ yandex_compute_instance.web ]
  for_each = { for vm in var.each_vm : "${vm.vm_name}" => vm }
  name        = "db-${each.key}"
  hostname    = "db-${each.key}"
  platform_id = var.web_platform
  
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = each.value.disk_type
      size     = each.value.disk_volume
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/ya.pub")}"
  }
  
  scheduling_policy { preemptible = true }
  
  network_interface {
    security_group_ids = [yandex_vpc_security_group.example.id]
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
}
