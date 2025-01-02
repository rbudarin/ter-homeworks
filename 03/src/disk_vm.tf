resource "yandex_compute_disk" "disk" {
  count = 3
  name	= "disk-${count.index + 1}"
  size	= 1
}

resource "yandex_compute_instance" "storage" {
  name     = var.storage_vm.vm_name
  hostname = var.storage_vm.vm_name

  resources {
    cores         = var.storage_vm.cpu
    memory        = var.storage_vm.ram
    core_fraction = var.storage_vm.core_fraction
  }
  boot_disk {
	initialize_params {
  	image_id = data.yandex_compute_image.ubuntu.image_id
	}
  }
  ynamic "secondary_disk" {
   for_each = "${yandex_compute_disk.disk.*.id}"
   content {
 	    disk_id = secondary_disk.value
   }
  }
  network_interface {
	subnet_id = yandex_vpc_subnet.develop.id
	nat   	= true
  }
  metadata = {
	ssh-keys = "ubuntu:${file("~/.ssh/ya.pub")}"
  }
}