terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.124.0"
    }
  }
  required_version = ">=1.10.0"
}


provider "yandex" {
  cloud_id                 = "####################"
  folder_id                = "####################"
  service_account_key_file = file("~/.ssh/.authorized_key.json")
  zone                     = "ru-central1-a" #(Optional) 
}


# You can set TF_LOG to one of the log levels (in order of decreasing verbosity) TRACE, DEBUG, INFO, WARN or ERROR to change the verbosity of the logs.
# export TF_LOG=DEBUG
# unset TF_LOG=DEBUG
