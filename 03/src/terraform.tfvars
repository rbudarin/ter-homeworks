vm_web_image  = "ubuntu-2004-lts"

web_platform = "standard-v3"

vms_resources = [{
  cores         = 2
  memory        = 2
  core_fraction = 20
}]

vm_web_hdd = [{
  type    = "network-hdd"
  size    = 5
}]

each_vm = [
  { 
    vm_name       = "main"
    cpu           = 2
    core_fraction = 20
    ram           = 2
    disk_type     = "network-hdd"
    disk_volume   = 20 
  }, 
  { 
    vm_name       = "replica"
    cpu           = 4
    core_fraction = 20
    ram           = 4
    disk_type     = "network-hdd"
    disk_volume   = 30
  }
]
