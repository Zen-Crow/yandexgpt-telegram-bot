variable "cloud_id" {
  type        = string
  description = "Cloud ID"
  default     = null
}

variable "folder_id" {
  type        = string
  description = "Folder ID"
  default     = null
}

variable "yc_token" {
  type        = string
  description = "Iam token"
  default     = null
}

variable "zone" {
  type        = string
  description = "Yandex Cloud zone"
  default     = "ru-central1-a"
}

variable "telegram_token" {
  type        = string
  description = "Telegram token"
  default     = null
}


