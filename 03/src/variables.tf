###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_web_image" {
  type        = string
  description = "VM OS image" 
}

variable "vm_web_hdd" {
  type = list(object({
    type  = string
    size  = number
  }))
  description = "VM HDD type"  
}

variable "vms_resources" {
  type = list(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
 description = "VM resourses map"
}

variable "web_platform" {
  type        = string
  description = "core standard"
}

variable "each_vm" {
  type = list(object({ 
    vm_name       = string
    cpu           = number
    ram           = number
    core_fraction = number
    disk_type     = string
    disk_volume   = number
    }))
  description = "each_vm"
}

