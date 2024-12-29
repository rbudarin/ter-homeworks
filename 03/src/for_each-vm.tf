# resource "random_password" "each" {
#   for_each    = toset([for k, v in yandex_compute_instance.example : v.name ])
#   length = 17
# #> type(random_password.each) object(object)
# }

# VM_WEB (2)
resource "yandex_compute_instance" "vm_db" {
  for_each    = toset([ 0, 1 ])
  
  name        = "web-${each.key}"
  hostname    = "web-${each.key}"
  platform_id = var.web_platform
  
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
    ssh-keys = "ubuntu:${file("~/.ssh/ya.pub")}"
  }
  
  scheduling_policy { preemptible = true }
  
  network_interface {
    security_group_ids = [yandex_vpc_security_group.example.id]
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
}
