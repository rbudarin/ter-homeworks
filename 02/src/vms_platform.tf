variable "default_zone_db" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr_db" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name_db" {
  type        = string
  default     = "develop-db"
  description = "VPC network & subnet name"
}

variable "vm_db_images" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex computer image"
}

variable "vm_db_platform_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Name VM"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "core standard"
}

variable "vm_db_resources_core" {
  type        = string
  default     = "2"
  description = "How many cores"
}

variable "vm_db_resources_memory" {
  type        = string
  default     = "2"
  description = "How many memory"
}

variable "vm_db_resources_core_fraction" {
  type        = string
  default     = "20"
  description = "How many core_fraction 5, 20, 50 ,100"
}
