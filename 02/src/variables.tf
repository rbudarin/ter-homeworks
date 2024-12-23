###cloud vars


variable "cloud_id" {
  type        = string
  default     = ""#####################################""
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = ""#####################################""
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
  default     = "develop-web"
  description = "VPC network & subnet name"
}

variable "vm_web_images" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex computer image"
}

variable "vm_web_platform_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Name VM"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "core standard"
}

variable "vm_web_resources_core" {
  type        = string
  default     = "2"
  description = "How many cores"
}

variable "vm_web_resources_memory" {
  type        = string
  default     = "1"
  description = "How many memory"
}

variable "vm_web_resources_core_fraction" {
  type        = string
  default     = "5"
  description = "How many core_fraction 5, 20, 50 ,100"
}

variable "vms_resources" {
  type = map(any)
 description = "VM resourses map"
}

variable "metadata" {
  type = map(string)
 description = "Access key map"
}

variable "test" {
  type = list(map(list(string)))
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = ""#####################################""
  description = "ssh-keygen -t ed25519"
}
