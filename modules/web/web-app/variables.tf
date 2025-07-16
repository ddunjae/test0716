variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "plan_name" {
  type = string
}

variable "sku_tier" {
  type    = string
  default = "Basic"
}

variable "sku_size" {
  type    = string
  default = "B1"
}

variable "app_name" {
  type = string
}

variable "docker_image" {
  description = "Docker 이미지 (예: nginx:latest)"
  type        = string
}

variable "app_settings" {
  type    = map(string)
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}
