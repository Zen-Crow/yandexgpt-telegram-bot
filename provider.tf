terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.131.0"
    }
  }
}


provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  token     = var.yc_token
  zone      = var.zone
}
